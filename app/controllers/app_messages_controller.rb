class AppMessagesController < ApplicationController

  before_action :authenticate_user!
  # before_action :ensure_correct_user, {only: [:destroy]}
  
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
  logger.debug("~~~~~~~~~~~~~~~~~~~~~~~~~~ params id = #{params[:id]}")
  logger.debug("~~~~~~~~~~~~~~~~~~~~~~~~~~ current_user.id = #{current_user.id}")
  @app_message = AppMessage.find_by("recruitment_id = ? and user_id = ?", params[:id], current_user.id)
  # Recruitments indexからCancelする場合
  if @app_message != nil
    @app_message.destroy
    redirect_to recruitments_path
  else
  # user showからcancelする場合
    AppMessage.find(params[:id]).destroy
    redirect_to recruitments_path
  end
end

private
  def app_mes_params
    params.require(:app_message).permit(:user_id, :content, :recruitment_id).merge(:user_id => current_user.id)
  end
  
  # def ensure_correct_user
  #   @app_message = AppMessage.find_by("recruitment_id = ? and user_id = ?", params[:id], current_user.id)
  #   if @app_message.user_id != current_user.id
  #     flash[:notice] = "You have no authority to access"
  #     redirect_to("/recruitments")
  #   end
  # end

end
