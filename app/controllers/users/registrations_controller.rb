class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_permitted_parameters, if: :devise_controller?
  respond_to :json
  include RackSessionFix
  
  private
  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?
    register_failed
  end
  def register_success
    render json: { message: 'Signed up sucessfully.' }
  end
  def register_failed
    render json: { message: "Something went wrong." }
  end
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address, :role_id, :email, :password])
  end
end



