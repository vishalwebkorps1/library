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

  def information(response)
    render json: response, status: 200
  end

  def handle_error(message)
    render json: { 'error' => message }, status: :unprocessable_entity
  end

  
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[ :email, :password ])
  end

  private

  def book_data(books)
    data=[]
    books.each do |book|
      data << {
        book_id: book.id,
        book_name: book.name,
        book_author: book.author,
        book_description: book.description,
        book_edition: book.edition,
        book_quantity: book.quantity,
        book_creator_id: book.user.id,
        book_created_by: book.user.name,
        book_creator_email: book.user.email,
        book_library_name: book.user.library_name,
        book_created_at: book.created_at,
        book_updated_at: book.updated_at
      }
    end
    data
  end
end


 

