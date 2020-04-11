class BlogsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create, :edit, :update, :destroy]

  def new
    @user = current_user
    @blog = Blog.new
  end

  def index
    @blogs = Blog.all
    @blogs = @blogs.order(created_at: :desc)
    @followers = current_user.following_user
    @followeds = current_user.follower_user
    @followers = @followers.order(created_at: :desc)
    @followeds = @followeds.order(created_at: :desc)
    @blog_comments = BlogComment.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if
      @blog.save
      flash[:success] = "投稿が完了しました"
      redirect_to blogs_path
    else
      render :new
    end
  end

  def show
    # @user = User.find(params[:user_id])
    @blog = Blog.find(params[:id])
    @blogs = Blog.all
    @blog_comments = @blog.blog_comments
    @blog_comments_order = @blog_comments.order(created_at: :desc)
    @blog_comment = BlogComment.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if
      @user.update(blog_params)
      flash[:success] = "投稿内容を更新しました"
      redirect_to blogs_path
    else
      render :edit
    end
  end

  def destroy
    @blog = Blog.find(params[:user_id])
    @blog.destroy
    flash[:success] = "投稿を削除しました"
    redirect_to blogs_path
  end


  private
  def blog_params
    params.require(:blog).permit(:body, :image)
  end

  def blog_comment_params
    params.require(:blog_comment).permit(:body)
  end
end


