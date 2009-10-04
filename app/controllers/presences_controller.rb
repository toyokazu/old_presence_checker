require 'ipaddr'
class PresencesController < ApplicationController
  def index
    if !params[:lecture_id].nil?
      @lecture = Lecture.find(params[:lecture_id])
    else
      @lecture = Lecture.first(:conditions => ['description = ?', params[:lect]])
    end
    @presences = Presence.with_lecture_id(params[:lecture_id]).with_lecture_description(params[:lect]).all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @presences }
    end
  end

  def show
    @presence = Presence.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @presence }
    end
  end

  def new
    @presence = init_presence(Presence.new(:ip_addr => request.env['REMOTE_ADDR'],
	:login => params[:login],
	:name => params[:name],
	:mail => params[:mail]))
    if @presence.nil?
      return false
    end
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @presence }
    end
  end

  def create
    @presence = init_presence(Presence.new(params[:presence]))
    if @presence.nil?
      return false
    end
    respond_to do |format|
      begin
        if @presence.save
          flash[:notice] = '出席登録が完了しました．'
          format.html { redirect_to(@presence) }
          format.xml  { render :xml => @presence, :status => :created, :location => @presence }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @presence.errors, :status => :unprocessable_entity }
        end
      rescue => error
        flash[:notice] = 'すでに登録済みです．'
        format.html { render :action => "new" }
        format.xml  { render :xml => @presence.errors, :status => :unprocessable_entity }
      end
    end
  end

  private
  def init_presence(presence)
    if !ip_addr_check(IPAddr.new(presence.ip_addr))
      render :text => 'Error: 指定された条件で実行してください．'
      return nil
    end
    if !params[:moodle_course_id].nil?
      # find Course related to the moodle course id
      presence.course = Course.first(:conditions => ['moodle_id = ?', params[:moodle_course_id]])
    end
    if presence.course.nil?
      render :text => 'Error: 有効な Moodle の Course ID が指定されていません．'
      return nil
    end
    # find ongoing Lecture
    presence.lecture = Lecture.with_course_id(presence.course.id).ongoing(Time.now).first
    if presence.lecture.nil?
      render :text => 'Error: 現在開講中の講義がありません．'
      return nil
    end
    # check ip address duplication
    owner = Presence.first(:conditions => ['lecture_id = ? and ip_addr = ?', presence.lecture, presence.ip_addr])
    if !owner.nil? && owner.login != presence.login
      presence.proxyed = true
    else
      presence.proxyed = false
    end
    presence
  end

  def ip_addr_check(remote_addr)
    net_addrs = [
      "133.101.56.0/21",
      "127.0.0.0/8"
    ].map {|addr| IPAddr.new(addr)}
    net_addrs.any? {|net_addr| net_addr.include?(remote_addr)}
  end

end
