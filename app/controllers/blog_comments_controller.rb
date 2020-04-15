class BlogCommentsController < ApplicationController
  before_action :authenticate_user!,only: [:index, :create, :destroy]

  def new
    @blog_comment = BlogComment.new
  end

  def create
    @blog = Blog.find(params[:blog_id])
    @blog_comment = @blog.blog_comments.new(blog_comment_params)
    # user = User.find(params[:user_id])
    @blog_comment.user_id = current_user.id
    if @blog_comment.save
      flash[:success] = "コメントを投稿しました"
     else
       redirect_to request.referer
    end
  end

  def destroy
    @blog_comment = BlogComment.find(params[:blog_id])
    if @blog_comment.user != current_user
      redirect_to request.referer
    end
    @blog_comment.destroy
    flash[:success] = "コメントを削除しました"
    redirect_to request.referer
  end

  private
  def blog_comment_params
    params.require(:blog_comment).permit(:comment)
  end
end

