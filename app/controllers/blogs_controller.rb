class BlogsController < ApplicationController
  before_action :authenticate_user!,only: [:index, :create, :edit, :update, :destroy]

  def new
    @user = current_user
    @blog = Blog.new
  end

  def create
    @blog = Blog.new
    @blog.user_id = current_user.id
    if
      @blog.save(blog_params)
      redirect_to users_path(current_user)
    else
      render :new
    end
  end

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if
      @user.update(blog_params)
      flash[:success] = "投稿内容を更新しました"
      redirect_to users_path(@user.id)
    else
      render :edit
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    flash[:success] = "投稿を削除しました"
    redirect_to users_path(@user.id)
  end

  private
  def blog_params
    params.require(:blog).permit(:body, :image)
  end
end
