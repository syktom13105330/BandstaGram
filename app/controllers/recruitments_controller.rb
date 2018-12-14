class RecruitmentsController < ApplicationController
  
  before_action :authenticate_user!
  after_action :checked_application, :only => [:show] 
  
  # postsに書いてあったからとりあえず
  
  def index
    # @recruitment = Search::Recruitment.new
    # @recruitment.new(params.require(rec_params))
    # if params[:area]
      @recruitments = Recruitment.search([params[:area],params[:part],params[:genre]])
      
    # if @recruitment.band_id != current_user.id
      @rec_room = RecRoom.new
    # end

  
    # @recruitments = Recruitment.all.order(created_at: "desc")
    logger.debug("--------------------- rec_search = #{params[:area]}")
    logger.debug("--------------------- rec_search = #{params[:part]}")
    logger.debug("--------------------- rec_search = #{params[:genre]}")

    
  end
  
  def show
    @recruitment = Recruitment.find(params[:id])
    @app_messages = AppMessage.where(recruitment_id: params[:id])
    @rec_room = RecRoom.new
    
  end
  
  # def search
  #   @recruitment = Search::Recruitment.new(search_params)
  #   @recruitments = @recruitment.matches
  # end
  
  def new
    @recruitment = Recruitment.new
  end
  
  def create
    @recruitment = Recruitment.new(rec_params)
    if @recruitment.save
      flash[:notice] = "Successfully posted!"
      redirect_to recruitments_path
    else
      render new_recruitment_path
    end
  end
  
  def edit
    @recruitment = Recruitment.find(params[:id])
  end
  
  def update
    @recruitment = Recruitment.find(params[:id])
    @recruitment.area = params[:recruitment][:area]
    @recruitment.part = params[:recruitment][:part]
    @recruitment.genre = params[:recruitment][:genre]
    @recruitment.r_info = params[:recruitment][:r_info]
    @recruitment.expired = params[:recruitment][:expired]
    
    if @recruitment.save
      flash[:notice] = "Your Wanted Post updated successfully"
      redirect_to recruitment_path
    else 
      render edit_recruitment_path
    end
  end
  
  def destroy
    @recruitment = Recruitment.find(params[:id])
    logger.debug("---------------------------------r_id = #{@recruitment.id}")
    @recruitment.destroy
    redirect_to recruitments_path
  end
  
  
  
  private
    def rec_params
      params.require(:recruitment).permit(:band_id, :r_info, :expired, :part, :gender, :area, :genre).merge(:band_id => current_user.id)
    end
    
    def checked_application
      AppMessage.where("status = ?", "a").update_all(status: "c")
      
      
    end
    # def search_params
    #   params
    #     .require(:search_product)
    #     .permit(Search::Recruitment::ATTRIBUTES)
    # end
  
end ##end of class
