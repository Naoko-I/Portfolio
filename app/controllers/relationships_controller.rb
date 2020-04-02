class RelationshipsController < ApplicationController
  def create
  	current_user.followings.new(following_id: params[:user_id])
    redirect_to request.referer
  end

  def destroy
  	current_user.followings.destroy(following_id: params[:user_id])
    redirect_to request.referer
  end
end
