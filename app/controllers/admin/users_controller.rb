class Admin::UsersController < ApplicationController
  before_action :authorize_admin_access, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to admin_user_path(user.id)

  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :is_deleted)
  end

  def authorize_admin_access
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to root_path
    end
  end

end
