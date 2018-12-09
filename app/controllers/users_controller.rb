class UsersController < ApplicationController
  # before_action :authenticate_user!, :only => [:show, :index, :edit, :update]
  before_action :authenticate_user!, :only => [:show, :index]
    
  def show
    ##current_userから見たfriend status表示
    @user = User.find(params[:id])
      @friend_status = ""
      @mes_status = ""
        # Friend.where(follower: current_user.id).each do |f|
          if Friend.find_by('follower = ? and followed = ?', current_user.id, params[:id]) 
            if Friend.find_by('follower = ? and followed = ?', params[:id], current_user.id) 
              @friend_status = "f"
              # 以下追加Chat用
              if @user.id == current_user.id
              else
                Entry.where(user_id: current_user.id).each do |f|
                  if Entry.find_by('room_id = ? and user_id = ?', f.room_id, params[:id])
                    @mes_status = "opened"
                    @mes_room = f.room_id
                  else
                    @mes_status = "unopened"
                    @room = Room.new
                    @entry = Entry.new
                  end
                end
              end
            else
              @friend_status = "r"
            end    
          else
            if Friend.find_by('follower = ? and followed = ?', params[:id], current_user.id) 
              @friend_status = "w"
            else
              @friend_status = ""
            end
          end  

    
    ## iのみ　所属バンド表示用
    @belong_bands = BelongBand.where(user_id: params[:id])
    ## gのみ　バンドメンバー表示用
    @bandmembers = BelongBand.where(band_id: params[:id])
        
    ##gのみ Media Information用   
    @band_details = BandDetail.where(user_id: params[:id]).order(id: "desc")
    @bdcomment = BandDetail.where(user_id: params[:id]).last
    
    # Nov 18 Post Total & Friend Total Index
    @posts = Post.where(writer_id: params[:id])
    @nfriends = [] #空にして
      Friend.where(follower: params[:id]).each do |f| #paramsがfollowerしてるだけ引っ張って
      if Friend.find_by('follower = ? and followed = ?', f.followed, params[:id])  #followし返してくれてるかifして
        @nfriends.push(f.followed)  #成立してる数だけ配列にどん
      end
    end
            
  end
  
  def index
    @users = User.search(params[:search])
    # @users = User.all
  end
  
  # def likes
  #   logger.debug("--------------------- Likes_user_id = #{params[:id]}")
    
  #   @user = User.find_by(id: params[:id])
  #   @likes = Like.where(user_id: @user.id)
  # end
  
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
    
end #class -- end
