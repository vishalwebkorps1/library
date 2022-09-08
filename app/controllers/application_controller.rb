class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller? #About login function
    def user_admin
        current_user.role == "admin"
    end
    def user_part
        current_user.role == "user"
    end
    # Errors Handling


    rescue_from CanCan::AccessDenied do
        render json: { 'message' => 'User is not authorised for this action!' }, status: 401
    end
    rescue_from ActiveRecord::RecordNotFound do |exception|
        # not_found_response('record not found!')
        # p exception
        render json: { message: 'Record not found'}
    end
    rescue_from ActionController::ParameterMissing do |e|
        # faliure_response("Wrong Parameters provided.")
        render json: { message: 'wrong parameters provided' }
    end
    
    protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys:[ :email, :password, :name, :role ])
    end




  end


 

