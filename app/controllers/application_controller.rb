class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_login

  def current_user
    @current_user ||= login_from_session
  end

  def login (user)
    session[:user_id] = user.id
    @current_user = user
  end

  def logout
    session[:user_id] = nil
    @current_user = nil
  end

  helper_method :current_user
  private

  def require_no_login
    redirect_to root_path if current_user
  end

  def require_login
    redirect_to new_session_path unless current_user
  end

  def login_from_session
    User.find_by_id(session[:user_id]) if session[:user_id] || false
  end

end
