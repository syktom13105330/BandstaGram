class RecRoomsController < ApplicationController
    
  before_action :authenticate_user!
  before_action :ensure_correct_user, {only: [:show]}
  after_action :checked_message, {only: [:show]}

  def create
    @rec_room = RecRoom.new(rec_room_params)
    if @rec_room.save
      @rec_entry1 = RecEntry.create(rec_entry_params)
      @rec_entry2 = RecEntry.create(:user_id => current_user.id, :rec_room_id => @rec_room.id, :recruitment_id => @rec_entry1.recruitment_id)
      redirect_to "/rec_rooms/#{@rec_room.id}"
      flash[:notice] = "Chatroom for Recruitement Created！"
    end
      
      
  end
  
  def show
  
    @rec_room = RecRoom.find(params[:id])
    @rec_messages = @rec_room.rec_messages
    @rec_message = RecMessage.new
    @rec_entries = @rec_room.rec_entries

  end
  
  private
    
    def rec_room_params
    params.require(:rec_room).permit(:recruitment_id)
    end
    
    def rec_entry_params
    params.require(:rec_entry).permit(:user_id, :rec_room_id, :recruitment_id).merge(:rec_room_id => @rec_room.id)
    end

    def ensure_correct_user
      @rec_room = RecRoom.find(params[:id])
      if RecEntry.find_by("rec_room_id = ? and user_id = ?", params[:id], current_user.id).present?
      else
        flash[:notice] = "You have no authority to access"
        redirect_to("/users/#{current_user.id}")
      end
    end
    
    def checked_message
      if RecMessage.user_id != current_user.id
        RecMessage.where("status = ?", "d" ).update_all(status: "c")
      end
    end
    
end
