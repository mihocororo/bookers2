class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:log_in, keys: [:name])
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:log_in, keys: [:email])
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
  
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

end
