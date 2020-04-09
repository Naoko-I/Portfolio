class RelationshipsController < ApplicationController
  def follow
  	current_user.follow(params[:id])
  	# followings.save
    redirect_to request.referer
  end

  def unfollow
    current_user.unfollow(params[:id])
    # followings.destroy
    redirect_to request.referer
  end
end
