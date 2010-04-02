# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  def current_user
    @current_user ||= session[:cas_user]
  end

  # change the condition for your environment
  def admin_user?
    current_user == 'akiyama'
  end

  def redirect_back_or_default
    redirect_to(request.referer || course_path)
  end

  def check_admin
    if !admin_user?
      flash[:notice] = "This page requires admin role."
      redirect_back_or_default and return
    end
  end
end
