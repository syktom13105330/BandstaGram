class LikesController < ApplicationController
    
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
    
end