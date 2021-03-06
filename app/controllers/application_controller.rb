class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :update_sanitized_params, if: :devise_controller?

  def update_sanitized_params
    logger.info('here')
    
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:email,:first_name, :last_name, :password, :password_confirmation)}
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:email, :first_name, :last_name, :password, :password_confirmation)}
  end
end
