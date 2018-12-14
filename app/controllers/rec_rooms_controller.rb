class RecRoomsController < ApplicationController
    
  before_action :authenticate_user!

  def create
    
    @rec_room = RecRoom.create
    redirect_to "/rec_rooms/#{@rec_room.id}"
    flash[:notice] = "Chatroom for Recruitement Created！"
    
  end
  
  
  def show
    
    @rec_room = RecRoom.find(params[:id])
    @rec_messages = @rec_room.rec_messages
    @rec_message = RecMessage.new
    @rec_entries = @rec_room.rec_entries
   
  end
  
  
end
