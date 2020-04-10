class RelationshipsController < ApplicationController
  def create
  	current_user.follow(params[:user_id])
  	flash[:notice] = "フォローユーザに登録しました"
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    flash[:notice] = "フォローを外しました"
    redirect_to request.referer
  end

  def follower
    @followers = current_user.following_user
  end

  def followed
    @followeds = current_user.follower_user
  end
end
