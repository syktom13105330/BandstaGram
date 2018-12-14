class AppMessagesController < ApplicationController

  before_action :authenticate_user!, :only => [:create]

def new
  @app_message = AppMessage.new
end

def create
  @app_message = AppMessage.new(app_mes_params)
  # 応募時のメッセージステータス（未読）
  @app_message.status = "a"
  logger.debug("--------------------------recruitment_id=#{params[:recruitment_id]}")
  if @app_message.save
    redirect_to recruitments_path
  else
    render "/app_messages/#{@recruitment.id}/new"
  end
end

def show
end

def edit
end

def update
end

def destroy
end

private
  def app_mes_params
    params.require(:app_message).permit(:user_id, :content, :recruitment_id).merge(:user_id => current_user.id)
  end

end
