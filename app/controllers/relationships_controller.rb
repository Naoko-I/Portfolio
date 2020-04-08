class RelationshipsController < ApplicationController
  def create
  	user = User.find(params[:user_id])
  	followings = Relationship.new(following_id: user.id, followed_id: current_user.id)
  	followings.save
    redirect_to request.referer
  end

  def destroy
    user = User.find(params[:user_id])
  	user = Relationship.find(following_id: user.id, followed_id: current_user.id)
  	followings.destroy
    redirect_to request.referer
  end
end
