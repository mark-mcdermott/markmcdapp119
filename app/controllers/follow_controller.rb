class FollowController < ApplicationController
  
  def follow_user 
    current_user = helpers.current_user 
    follow_user = params[:id]
    
  end

end