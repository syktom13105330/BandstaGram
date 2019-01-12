class MessagesController < ApplicationController
    
  before_action :authenticate_user!, :only => [:create]
    
  def create
    @message = Message.new(mes_params)
    # メッセージステータス（未読）
    @message.status = "n"
    if @message.save
      redirect_to "/rooms/#{@message.room_id}"
    else
      flash[:notice] = "Couldn't send the Message"
      render "/rooms/#{@message.room_id}"
    end
  end
  
  private 
    def mes_params
      params.require(:message).permit(:user_id, :room_id, :content).merge(:user_id => current_user.id)
    end


end
