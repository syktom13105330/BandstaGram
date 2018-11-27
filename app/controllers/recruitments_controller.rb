class RecruitmentsController < ApplicationController
  
  before_action :authenticate_user!
  # postsに書いてあったからとりあえず
  
  def index
    # @recruitment = Search::Recruitment.new
    # @recruitment.new(params.require(rec_params))
    # if params[:area]
      @recruitments = Recruitment.search([params[:area],params[:part],params[:genre]])
  
    # @recruitments = Recruitment.all.order(created_at: "desc")
    logger.debug("--------------------- rec_search = #{params[:area]}")
    logger.debug("--------------------- rec_search = #{params[:part]}")
    logger.debug("--------------------- rec_search = #{params[:genre]}")

    
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
  
  
  
  private
    def rec_params
      params.require(:recruitment).permit(:band_id, :r_info, :expired, :part, :gender, :area, :genre).merge(:band_id => current_user.id)
    end
    
    # def search_params
    #   params
    #     .require(:search_product)
    #     .permit(Search::Recruitment::ATTRIBUTES)
    # end
  
end ##end of class
