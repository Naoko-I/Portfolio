class FavoritesController < ApplicationController
  def index
  	user = current_user
  	@favorites = user.favorites_blog
  end

  def create
  	@blog = Blog.find(params[:blog_id])
  	favorites = @blog.favorites.new(user_id: current_user.id)
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

private
	# def redirect
	# case params[:redirect_id].to_i
	# when 0
	  # redirect_to blogs_path
	# when 1
	  # redirect_to blogs_path(@blog)
	# end
	# end
end
