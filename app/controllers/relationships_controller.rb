class RelationshipsController < ApplicationController
  def create
  	current_user.following(params[:user_id])
    redirect_to request.referer
  end

  def destroy
  	current_user.following(params[:user_id])
    redirect_to request.referer
  end

  def following
  	user = User.find(params[:user_id])
    @user = User.find(params[:user_id]).following_user
  end
  def followed
  	user = User.find(params[:user_id])
  	@user = User.find(params[:user_id]).followed_user
end
