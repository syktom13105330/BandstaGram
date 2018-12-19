class RecMessagesController < ApplicationController
    
  before_action :authenticate_user!, :only => [:create]
  
  def create
    @rec_message = RecMessage.new(rec_mes_params)
    # メッセージステータス（未読）
    @rec_message.status = "d"
    if @rec_message.save
      redirect_to "/rec_rooms/#{@rec_message.rec_room_id}"
    else
      flash[:notice] = "Couldn't send the Message"
      render "/rec_rooms/#{@rec_message.rec_room_id}"
    end
  end

  private
    def rec_mes_params
      params.require(:rec_message).permit(:user_id, :content, :rec_room_id).merge(:user_id => current_user.id)
    end
    
end
