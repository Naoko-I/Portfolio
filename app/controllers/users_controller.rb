class UsersController < ApplicationController
   before_action :authenticate_user!
   before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.all
    # @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "プロフィールを更新しました"
      redirect_to users_path(@user.id)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      sign_out user
      redirect_to root_path
    end
  end

  def follower
    @user = User.find(params[:id])
    @followers = current_user.following_user
  end

  def followed
    @user = User.find(params[:id])
    @followeds = current_user.follower_user
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :profile_image, :introduction)
    end

    def correct_user
      unless params[:id].to_i == current_user.id
        redirect_to user_path(current_user)
      end
    end
end
