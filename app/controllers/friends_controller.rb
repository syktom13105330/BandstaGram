class FriendsController < ApplicationController
  
  def index
    
    @friends = []
    @request_friends = []
    @receive_friends = []
    @friend_status = ""
    
    Friend.where(follower: current_user.id).each do |f|
      if Friend.find_by('follower = ? and followed = ?', f.followed, current_user.id) 
      logger.debug("--------------------- 友達　f.followed = #{f.followed}")
        @friends.push(f.followed)
        @friend_status = "f"
        
      else
      logger.debug("--------------------- 申請中f.followed = #{f.followed}")
       
        @request_friends.push(f.followed)
        @friend_status = "r"

      end
    end
    
    Friend.where(followed: current_user.id).each do |f|
      if !Friend.find_by('follower = ? and followed = ?', current_user.id, f.follower) 
      logger.debug("--------------------- 承認待ち　f.followed = #{f.follower}")
        	@receive_friends.push(f.follower)
    	    @friend_status = "w"

      end
    end
         
  end
  
  
  def create
      # if !Friend.find_by(follower: @current_user.id, followed: params[@user.id])
        @friend = Friend.new(
            follower: current_user.id,
            followed: params[:id])
        @friend.save
        logger.debug("--------------------- 承認　f.follower = #{@friend.follower}")
        logger.debug("--------------------- 承認　f.followed = #{@friend.followed}")
        redirect_to("/friends")
      # end    
  end

  
end
