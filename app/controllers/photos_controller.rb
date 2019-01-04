class PhotosController < ApplicationController
  
  before_action :authenticate_user!
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
  
  def new
    @photo = Photo.new
  end
  
  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to photos_path
    else
      render new_photo_path
    end
  end

  def index
    @photos = Photo.all.order(id: "desc")
  end
  
  def show
    @photo = Photo.find(params[:id])
  end
  
  def image_show
    @photo = Photo.find(params[:id])
    # @image = @photo.images{(params[:cnt]).to_i}
    @cnt = params[:cnt].to_i
    logger.debug("--------------------------@photo_id=#{params[:id]}")
    logger.debug("--------------------------@image[cnt]=#{params[:cnt]}")
  end
  
  def edit
    @photo = Photo.find(params[:id])
  end
  
  def update
    @photo = Photo.find(params[:id])
    @photo.content = params[:photo][:content]
    if @photo.save
      flash[:notice] = "Comment successfully updated!"
      redirect_to photo_path
    end
  end
  
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
      redirect_to photos_path
  end    
  
  private
  
  def photo_params
    params.require(:photo).permit(:user_id, :content, {images: []}).merge(:user_id => current_user.id)
  end

  def ensure_correct_user
    @photo = Photo.find(params[:id])
    if @photo.user_id != current_user.id
      flash[:notice] = "You have no authority to access"
      redirect_to("/photos")
    end
  end
  
end
