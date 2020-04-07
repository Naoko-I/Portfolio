class BlogsController < ApplicationController
  before_action :authenticate_user!,only: [:index, :create, :edit, :update, :destroy]

  def new
    @user = current_user
    @blog = Blog.new
  end

  def create
    @blog = Blog.new
    @blog.user_id = current_user.id
     if @blog.save(blog_params)
        redirect_to users_path(current_user)
     else
        render :new
     end
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def blog_params
    params.require(:blog).permit(:body, :image)
  end
end
