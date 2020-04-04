class BlogsController < ApplicationController
  def new
    @user = current_user
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
     if @blog.save
        flash[:notice] = "You have creatad Caption successfully."
        redirect_to user_path(current_user)
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
