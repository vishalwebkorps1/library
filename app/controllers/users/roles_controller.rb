class Users::RolesController < ApplicationController
  load_and_authorize_resource 
  def index
    @roles = Role.all
    render json: @roles, status: :ok
  end
  def show
    @roles = Role.find(params[:id])
    render json: @roles, status: :ok
  end
  def create
    @roles = Role.new(roles_params)
    if @roles.save
      render json: @roles, status: :created
    else
      render json: { errors: @user.errors.full_messages}
    end
  end
  def update
    @roles = Role.find(params[:id])
    if @roles.update(roles_params)
      render json: { meassage: "role was updated successfully"}
    else
      render json: { errors: @roles.errors.full_messages}, status: :unprocessable_entity
    end
  end
  def destroy
    @roles = Role.find(params[:id])
    if @roles.destroy
      render json: {message: "role was deleted successfully"}
    else
      render json: { errors: @roles.errors.full_messages}, status: :unprocessable_entity
    end
  end
  private
  def set_roles
    @roles = Role.find(params[:id])
  end
  def roles_params
    params.permit(:name)
  end
end






