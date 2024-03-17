class ApplicationController < ActionController::Base
  helper_method :current_user

  rescue_from ActiveModel::ValidationError do |exception|
    redirect_to root_path, alert: exception.message
  end

  private

  def authenticate_user
    redirect_to new_session_path unless current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
