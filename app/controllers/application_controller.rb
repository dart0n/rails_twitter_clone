class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || user_path(current_user.id)
  end

  def current_user_path
    user_path(current_user.id)
  end
end
