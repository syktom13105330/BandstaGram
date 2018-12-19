class LikesController < ApplicationController

  before_action :authenticate_user!, :only => [:create, :destroy]
  before_action :ensure_correct_user, {only: [:destroy]}

  def create
      @like = Like.new(
          user_id: current_user.id,
          post_detail_id: params[:post_detail_id]
          )
  #   logger.debug("~~~~~~~~~~~~~~~~~~~~~current_user =  #{@current_user.id}")
  
      @like.save
      redirect_to("/posts/#{params[:post_id]}")
  end
  
  def destroy
      @like = Like.find_by(
          user_id: current_user.id,
          post_detail_id: params[:post_detail_id]
          )
      @like.destroy
      redirect_to("/posts/#{params[:post_id]}")
  end
  
  private
  
    def ensure_correct_user
      @like = Like.find_by(
          user_id: current_user.id,
          post_detail_id: params[:post_detail_id]
          )
      if @like.user_id != current_user.id
        flash[:notice] = "You have no authority to access"
        redirect_to("/users/#{current_user.id}")
      end
    end  
    
end