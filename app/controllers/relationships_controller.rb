class RelationshipsController < ApplicationController
  def create
  	current_user.following.new(following_id: params[:user_id])
    redirect_to request.referer
  end

  def destroy
  	current_user.following.destroy(following_id: params[:user_id])
    redirect_to request.referer
  end
end

