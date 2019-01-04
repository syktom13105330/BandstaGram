class GoodsController < ApplicationController
  
  before_action :authenticate_user!, :only => [:create, :destroy]
  
  def create
    @good = Good.new(
      user_id: current_user.id,
      photo_id: params[:id],
      image_no: params[:cnt].to_i
      )
    @good.save
    redirect_to("/photos/#{params[:id]}")
  end
  
  def destroy
    @good = Good.find_by(
      user_id: current_user.id,
      photo_id: params[:id],
      image_no: params[:cnt].to_i
      )
    @good.destroy
    redirect_to("/photos/#{params[:id]}")
  end  
  
end
