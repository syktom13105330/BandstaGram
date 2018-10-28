class FriendsController < ApplicationController
  
  def index
    
    @friends = []
    @request_friends = []
    @receive_friends = []
    
    Friend.where(follower: current_user.id).each do |f|
      if Friend.find_by('follower = ? and followed = ?', f.followed, current_user.id) 
      logger.debug("--------------------- 友達　f.followed = #{f.followed}")
        @friends.push(f.followed)
      else
      logger.debug("--------------------- 申請中f.followed = #{f.followed}")
       
        @request_friends.push(f.followed)
      end
    end
    
    Friend.where(followed: current_user.id).each do |f|
      if !Friend.find_by('follower = ? and followed = ?', current_user.id, f.follower) 
      logger.debug("--------------------- 承認待ち　f.followed = #{f.follower}")
        	@receive_friends.push(f.follower)
      end
    end
         
  end
  
  def create
      # if !Friend.find_by(follower: @current_user.id, followed: params[@user.id])
        @friend = Friend.new(
            follower: current_user.id,
            followed: params[:user.id])
        @friend.save
        logger.debug("--------------------- 承認　f.follower = #{f.follower}")
        logger.debug("--------------------- 承認　f.followed = #{f.followed}")
        redirect_to("/friends")
      # end    
  end
  
  
end
