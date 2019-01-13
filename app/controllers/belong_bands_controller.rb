class BelongBandsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :ensure_correct_user, {only: [:destroy]}
  
  def index
  end
  
# "i"のみ所属バンド追加用(BelongBand)
  def new
    @belong_band = BelongBand.new
    @users = User.search(params[:search])
    # @users = User.where(user_type:"g")
    # @users = User.search(params[:search])

  end
  
# "g"のみ　バンドメンバー追加用(BelongBand)  
  def addmem
    @belong_bnad = BelongBand.new
    @users = User.search(params[:search])
    # @users = User.where(user_type: "i")
    
  end
  
  ## iのみ　所属バンド追加用
  def create
    @users = User.find(params[:id])
    @belong_band = BelongBand.new(
      user_id: current_user.id,
      band_id: params[:id])
      
      logger.debug("---------------------------------band_id = #{@belong_band.band_id}")
    
    if @belong_band.save
      redirect_to("/users/#{current_user.id}")
    else
    end
  end
  
  ##gのみ　メンバー追加用
  def createmem
    @users=User.find(params[:id])
    @belong_band = BelongBand.new(
      user_id: params[:id],
      band_id: current_user.id)
      
    if @belong_band.save
      redirect_to("/users/#{current_user.id}")
    else
    end
  end
  
  def destroy
    @belong_band = BelongBand.find(params[:id])
    @belong_band.destroy
      redirect_to("/users/#{current_user.id}")
  
  end
  
  private
    
    def ensure_correct_user
      @belong_band = BelongBand.find(params[:id])
      if @belong_band.user_id != current_user.id
        if  @belong_band.band_id != current_user.id
          flash[:notice] = "You have no authority to access"
          redirect_to("/users/#{current_user.id}")
        end  
      end
    end  
  
end
