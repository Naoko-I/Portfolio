class UsersController < ApplicationController
   before_action :authenticate_user!

  def index
    @users = User.all
    @blogs = Blog.all
    @followings = current_user.followings
    @followeds = current_user.followeds
    @blog_comment = BlogComment.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
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

  def followings
  end

  def followeds
  end

  private

  def user_params
    #is_deleatedカラム加える??
    params.require(:user).permit(:name, :email, :profile_image, :introduction)
  end
end