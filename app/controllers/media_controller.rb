class MediaController < ApplicationController
  def new
    @medium = Medium.new
  end

  def create
    @medium = Medium.new(medium_params)
    if @medimu.save
      redirect_to user_url(id: @medium.user_id)
    else
      render new_medium_path
    end
  end
  
  def show
    @medium = Medium.find(params[:id])
    @cnt = params[:cnt].to_i
  end
  
  def edit
    @medium = Medium.find(params[:id])
  end
  
  def update
    @medium = Medium.find(params[:id])
    @medium.intro = params[:medium][:intro]
    if @medium.save
      flash[:notice] = "Comment Successfully Updated!"
      redirect_to user_url(id: @medium.user_id)
    end
  end
  
  def destroy
    @medium = Medium.find(params[:id])
    @medium.destroy
    flash[:notice] = "Medium/Media Successfully Deleted!"
    redirect_to users_path
  end

  private
    def medium_params
      params.require(:medium).permit(:user_id, :intro, {media: []}).merge(:user_id => current_user.id)
    end
end
