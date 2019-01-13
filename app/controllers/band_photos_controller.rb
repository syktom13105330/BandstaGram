class BandPhotosController < ApplicationController
  
  before_action :authenticate_user!
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

  def new
    @band_photo = BandPhoto.new
  end
  
  def create
    @band_photo = BandPhoto.new(band_photo_params)
    # if @band_photo.images.count < 6
    if @band_photo.save
      redirect_to user_url(id: @band_photo.user_id)
    else
      # flash[:notice] = "Up to 5 files!"
      render new_band_photo_path
    end
  end
  
  def show
    @band_photo = BandPhoto.find(params[:id])
    @cnt = params[:cnt].to_i
  end
  
  def edit
    @band_photo = BandPhoto.find_by(user_id: params[:id])
  end
  
  def update
    @band_photo = BandPhoto.find_by(user_id: params[:id])
    @band_photo.intro = params[:band_photo][:intro]
    if @band_photo.save
      flash[:notice] = "Comment Successfully Updated!"
      redirect_to user_url(id: @band_photo.user_id)
    end
  end
  
  def destroy
    @band_photo = BandPhoto.find_by(user_id: params[:id])
    @band_photo.destroy
    flash[:notice] = "Media Successfully Deleted"
    redirect_to photos_path
  end
  
  private
    def band_photo_params
      params.require(:band_photo).permit(:user_id, :intro, {images: []}).merge(:user_id => current_user.id)
    end
    
    def ensure_correct_user
      @band_photo = BandPhoto.find_by(user_id: params[:id])
      if @band_photo.user_id != current_user.id
        flash[:notice] = "You have no authority to access"
        redirect_to("/users")
      end
    end
  
end
