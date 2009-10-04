class LecturesController < ApplicationController
  def index
    @lectures = Lecture.with_course_id(params[:course_id]).all
  end

end
