class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def authenticate
    redirect_to new_session_path unless current_user
  end

  def set_current_user(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def clear_current_user
    @current_user = nil
    session.delete(:user_id)
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

end
