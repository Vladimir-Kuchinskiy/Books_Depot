class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_admin
    redirect_to root_path, notice: "You don't have rights to view this page" unless current_user && current_user.admin?
  end

end
