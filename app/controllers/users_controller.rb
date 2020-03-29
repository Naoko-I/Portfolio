class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    users = User.all
    #user = User.find(params[:id])
  end

  def show
    user = User.find(params[:id])
  end

  def edit
    user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(@user.id)
    if end_user.is_deleted
      #ログアウト処理
      sign_out end_user
      redirect_to root_path
    else
      redirect_to users_path
    end
  end

  def withdraw
  end

  private

  def user_params
    #is_deleatedカラム加える??
    params.require(:user).permit(:name, :email, :profile_image)
  end
end