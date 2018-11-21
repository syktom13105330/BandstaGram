class BelongBandsController < ApplicationController
  
  def index
  end
  
# "i"のみ所属バンド追加用(BelongBand)
  def new
    @belong_band = BelongBand.new
    @users = User.where(user_type:"g")
    # @users = User.search(params[:search])

  end
  
# "g"のみ　バンドメンバー追加用(BelongBand)  
  def addmem
    @belong_bnad = BelongBand.new
    @users = User.where(user_type: "i")
  end
  
  
  def create
    @users = User.find_by(user_type:"g")
    @belong_band = BelongBand.new(
      user_id: current_user.id,
      band_id: params[:band_id])
      
      logger.debug("---------------------------------band_id = #{@belong_band.band_id}")
    
    @belong_band.save
    redirect_to("/users/#{params[:user_id]}")
  end
  
  def createmem
    @users=User.find(params[:id])
    @belong_band = BelongBand.new(
      user_id: params[:id],
      band_id: current_user.id)
      
    @belong_band.save
    redirect_to("/users/#{params[:user_id]}")
  end
  
end
