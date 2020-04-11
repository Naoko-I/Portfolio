class BlogCommentsController < ApplicationController
  before_action :authenticate_user!
  # ,only: [:index, :create, :edit, :update, :destroy]

  def new
    @comment = BlogComment.new
  end

  def create
    @book = Book.find(params[:blog_id])
    @comment = BlogComment.new
    @blog_comment = @blog.blog_comments.new(blog_comment_params)
    @blog_comment.user_id = current_user.id
    if @comment.save(blog_comment_params)
      flash[:success] = "コメントを投稿しました"
    else
      redirect_to request.referer
      # ???@book_comments = BookComment.where(id: @book)
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
    @comment = BlogComment.find(params[:blog_id])
    @blog = @blog_comment.blog
    @comment.destroy
    flash[:success] = "投稿を削除しました"
    redirect_to users_path(@user.id)
  end
    if @blog_comment.user != current_user
      redirect_to request.referer
    end

  private
  def blog_comment_params
    params.require(:blog_comment).permit(:body)
  end
end
