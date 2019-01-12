class RoomsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :ensure_correct_user, {only: [:show]}
  after_action :checked_fmessage, {only: [:show]}
  
  def create
    @room = Room.create
    @entry1 = Entry.create(:room_id => @room.id, :user_id => current_user.id)
    @entry2 = Entry.create(entry_params)
    redirect_to "/rooms/#{@room.id}"
    flash[:notice] = "Chatroom Created"
  end
  
  def show
    @room = Room.find(params[:id])
    @messages = @room.messages.order(id: "desc")
    @message = Message.new
    @entries = @room.entries
  end
  
  # Jan_12
  def index
    @messages = Message.all
    @entries = Entry.all
    @rec_rooms = RecRoom.all
    @recruitments = Recruitment.all
    @app_messages = AppMessage.all.order(id: "desc")
    @rec_entries = RecEntry.all
    @rec_messages = RecMessage.all
  end

  private
    def entry_params
    params.require(:entry).permit(:user_id, :room_id).merge(:room_id => @room.id)
    end
    
    def ensure_correct_user
      @room = Room.find(params[:id])
      if Entry.find_by("room_id = ? and user_id = ?", params[:id], current_user.id).present?
      else
        flash[:notice] = "You have no authority to access"
        redirect_to("/users/#{current_user.id}")
      end
    end
    
    def checked_fmessage
      @messages = @room.messages.each do |rm|
        if rm.user_id != current_user.id
          if rm.status == "n"
            rm.update(status: "c")
          # rm.where("status = ?", "d" ).update_all(status: "c")
          end
        end
      end  
    end
  
end
