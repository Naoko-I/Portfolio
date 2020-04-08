class UsersController < ApplicationController
   before_action :authenticate_user!
   before_action :correct_user, only: [:edit, :update]

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
    if
      @user.update(user_params)
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

  def followings
    @user = current_user
    @followeds = current_user.followeds
  end

  def followeds
    @user = current_user
    @followings = current_user.followings
  end

  private
    def user_params
      #paranoia使う場合はis_deleated削除
      params.require(:user).permit(:name, :email, :profile_image, :introduction)
    end

    def correct_user
      @user = User.find(params[:id])
        if @user.id != current_user.id
          redirect_to user_path(current_user)
        end
    end
end
