class FollowController < ApplicationController
  
  def follow_user 
    current_user = helpers.current_user 
    followed_user_id = params[:id]
    Relationship.create(follower_id: current_user.id, followed_id:followed_user_id)
    redirect_to "/users"
  end

  def unfollow_user 
    current_user = helpers.current_user 
    followed_user_id = params[:id]
    Relationship.where(follower_id: current_user.id).where(followed_id: followed_user_id).destroy_all
    redirect_to "/users"
  end

end