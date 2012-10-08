class ApplicationController < ActionController::Base
  protect_from_forgery


  private


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user


  def user_favorites
    @user_favorites ||= User.find(session[:user_id]).products if session[:user_id]
  end
  helper_method :user_favorites

end
