class FavoritesController < ApplicationController
  def index
    @blog = Blog.find(params[:blog_id])
    @blogs = current_user.favorites.find_by(blog_id: @blog.id, user_id: current_user.id)
    # ↑エラー回復後に6行目削除
    @blogs = Blog.all
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


