class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private
  def respond_with(resource, _opts = {})
    return render json: { message: 'wrong credentials'} unless current_user
    render json: { message: 'You are logged in.' }, status: :ok
  end

  def respond_to_on_destroy
    unless user_signed_in?
      render json: {
        status: 200,
        message: "logged out successfully"
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "Couldn't find an active session."
      }, status: :unauthorized
    end
  end
end

