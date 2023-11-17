class Admin::UsersController < ApplicationController
   before_action :authenticate_admin!
  
  def index
    @users = User.all.page(params[:page]).per(6)
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def update
    user = User.find(params[:id])
    user.update!(is_deleted: false)
    flash[:notice] = "success"
    redirect_to admin_user_path(user)
  end

  def destroy
    user = User.find(params[:id])
    user.update!(is_deleted: true)
    flash[:notice] = "success"
    redirect_to admin_user_path(user)
  end
end
