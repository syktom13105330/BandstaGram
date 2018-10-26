# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

 
  def after_update_path_for(resource)
    edit_user_registration_path
  end


  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    logger.debug("--------------------------email=#{params[:user][:email]}")
    logger.debug("--------------------------user_type=#{params[:user][:user_type]}")
    super
    user = User.last
    user.user_type = params[:user][:user_type]
    user.save
  end

  # # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  def update
    logger.debug("--------------------------genre=#{params[:user][:genre]}")
    logger.debug("--------------------------user_type=#{params[:user][:area]}")
    logger.debug("--------------------------icon=#{params[:user][:icon]}")    
    logger.debug("--------------------------profile=#{params[:user][:profile]}")    
    logger.debug("--------------------------gender=#{params[:user][:gender]}")    
    logger.debug("--------------------------waiting=#{params[:user][:waiting]}")    
    logger.debug("--------------------------part=#{params[:user][:part]}")    
    super
    user = User.find_by(params[:id])
    # if user.id == current_user.id
      user.update(params.require(:user).permit(:name, :user_type, :banmas_id, :profile, :genre, :email, :password, :icon, :area, :gender, :waiting, :part))
      # redirect_to "/users/#{user.id}/edit"
    # else
      # redirect_to "/" and return
      # flash[:alert] = "You have no permission to access"
    # end
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :user_type, :banmas_id, :profile, :genre, :email, :password, :icon, :area, :gender, :waiting, :part])
    devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
