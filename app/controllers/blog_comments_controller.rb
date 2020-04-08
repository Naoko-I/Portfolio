class BlogCommentsController < ApplicationController
  before_action :authenticate_user!,only: [:index, :create, :edit, :update, :destroy]

  def new
    @comment = BlogComment.new
  end

  def create
    @comment = BlogComment.new
    @blog.user_id = current_user.id
    if
      @comment.save(blog_comment_params)
      redirect_to users_path(current_user)
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

  def destroy
    @comment = BlogComment.find(params[:id])
    @comment.destroy
    flash[:success] = "投稿を削除しました"
    redirect_to users_path(@user.id)
  end

  private
  def blog_comment_params
    params.require(:blog_comment).permit(:body)
  end
end
