class ApplicationController < ActionController::API

    rescue_from CanCan::AccessDenied do |exception|
        render json: { 'message' => 'User is not authorised for this action!' }, status: 401
        p exception
      end
    
      rescue_from ActiveRecord::RecordNotFound do |exception|
        not_found_reponse('record not found!')
        p exception
      end
    
      rescue_from ActionController::ParameterMissing do |e|
        faliure_response("Wrong Parameters provided.")
      end


end
