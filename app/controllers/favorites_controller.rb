class FavoritesController < ApplicationController
  def index
  	@user = current_user
  	@favorite = @user.favorites_blog(params[:blog_id])
    # @favorites = Blog.find.current_user.favorites(params[:blog_id])
  end

  def create
  	@blog = Blog.find(params[:blog_id])
  	favorite = @blog.favorites.new(user_id: current_user.id)
  	favorite.save
    redirect_to request.referer
  end

  def destroy
  	@blog = Blog.find(params[:blog_id])
    favorite = current_user.favorites.find_by(blog_id: @blog.id)
    favorite.destroy
    redirect_to request.referer
  end
end

#応用課題
# private
	# def redirect
	# case params[:redirect_id].to_i
	# when 0
	  # redirect_to blogs_path
	# when 1
	  # redirect_to blogs_path(@blog)
	# end
	# end
# end
