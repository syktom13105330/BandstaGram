class RecruitmentsController < ApplicationController
  
  before_action :authenticate_user!
  # postsに書いてあったからとりあえず
  
  def index
    @recruitments = Recruitment.search(params[:search])
    # @recruitments = Recruitment.all.order(created_at: "desc")
    @genres = Genre.all
  end
  
  def new
    @recruitment = Recruitment.new
  end
  
  def create
    @recruitment = Recruitment.new(rec_params)
    logger.debug("--------------------------band_id=#{params[:recruitment][:band_id]}")
    if @recruitment.save
      flash[:notice] = "Successfully posted!"
      redirect_to recruitments_path
    else
      render new_recruitment_path
    end
  end
  
  
  
  private
    def rec_params
      params.require(:recruitment).permit(:band_id, :r_info, :expired, :part, :gender, :area).merge(:band_id => current_user.id)
    end
  
end ##end of class
