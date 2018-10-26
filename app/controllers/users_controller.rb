class UsersController < ApplicationController
  # before_action :authenticate_user!, :only => [:show, :index, :edit, :update]
  before_action :authenticate_user!, :only => [:show, :index]
    
  def show
    @user = User.find(params[:id])
  end
  
  def index
    @users = User.all
  end
  
  # def edit
  #   @user = User.find(params[:id])
  #   if @user.id == current_user.id
  #   else
  #     redirect_to "/"
  #     flash[:alert] = "You don't have permission to access"
  #   end
  # end
  
  # def update
  #   @user = User.find(params[:id])
  #   if @user.id == current_user.id
  #     @user.update(params.require(:user).permit(:name, :user_type, :banmas_id, :profile, :genre, :email, :password, :icon, :area, :gender, :waiting, :part))
  #     redirect_to "/users/#{@user.id}/edit"
  #     flash[:notice] = "Saved!"
  #   else
  #     redirect_to "/"
  #     flash[:alert] = "You have no permission to access"
  #   end
  # end
  
end
