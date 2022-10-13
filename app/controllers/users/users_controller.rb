class Users::UsersController < ApplicationController
  load_and_authorize_resource 
  # GET /users
  def index
    @users = User.all
    render json: @users, status: :ok
  end
  # GET /users/{userid}
  def show
    @user = User.find(params[:id])
    # @user.has_role?(:admin) #|| @record.course.user_id == @user.id
    render json: @user, status: :ok
  end
  # PUT /users/{userid}
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: { message:"User Updated" }
    else
      render json: { errors: @user.errors.full_messages },status: :unprocessable_entity
    end
  end
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      render json: { message:"User Deleted" },status: :unprocessable_entity
    else  
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end
  private
  def find_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'User not found' }, status: :not_found
  end
  def user_params
    params.require(:user).permit( :name, :email, :password, :role_id, :address)
  end
end





