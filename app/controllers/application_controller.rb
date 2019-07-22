class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # params.permit(:registration, :first_name, :email, :password)

    # devise_parameter_sanitizer.permit(:registration)
    puts params.inspect
    devise_parameter_sanitizer.permit(:registration)
  end
end
