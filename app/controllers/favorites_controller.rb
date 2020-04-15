class FavoritesController < ApplicationController
  def index
    # @blog = Blog.find(params[:blog_id])
    # blog_idのみを引っ張ってくるためselectメソッドを使用
    @favorites = Favorite.where(user_id: current_user.id)
    favoriteList = Favorite.where(user_id: current_user.id).select([:blog_id])
    @blogs = Blog.where(id: favoriteList)
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
    flash[:success] = "お気に入りを削除しました"
    redirect_to request.referer
  end

  private
  	def redirect
  	  case params[:redirect_id].to_i
  	  when 0
  	   redirect_to blogs_path
  	  when 1
  	   redirect_to blogs_path(@blog)
  	   end
  	end
end

