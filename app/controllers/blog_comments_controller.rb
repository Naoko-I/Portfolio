class BlogCommentsController < ApplicationController
  before_action :authenticate_user!,only: [:index, :create, :edit, :update, :destroy]

  def new
    @blog_comment = BlogComment.new
  end

  def create
    @blog = Blog.find(params[:blog_id])
    @blog_comment = BlogComment.new
    @blog_comment.user_id = current_user.id
    if @blog_comment.save
      flash[:success] = "コメントを投稿しました"
    else
      redirect_to request.referer
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if
      @user.update(blog_comment_params)
      flash[:success] = "コメントを更新しました"
      redirect_to users_path(@user.id)
    else
      render :edit
    end
  end

  def destroy
    @comment = BlogComment.find(params[:blog_id])
    @blog = @blog_comment.blog
    @comment.destroy
    flash[:success] = "投稿を削除しました"
    redirect_to users_path(@user.id)
    if @blog_comment.user != current_user
      redirect_to request.referer
    end
  end

  private
  def blog_comment_params
    params.require(:blog_comment).permit(:comment)
  end
end

