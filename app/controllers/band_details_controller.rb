class BandDetailsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
  
  def new
    @band_detail = BandDetail.new
  end
  
  def create
    require 'fileutils'
    
      # logger.debug("--------------------------image length =#{params[:images].length}")
      logger.debug("--------------------------BandDetail.where(user_id: current_user.id).count = #{BandDetail.where(user_id: current_user.id).count}")

    if params[:images] && (params[:images].length + BandDetail.where(user_id: current_user.id).count) < 6
      #User showから新規投稿した時の複数選択枚数＋既存のレコード数の合計が６より小さい時通過（＝現状最大５ファイルまで）
    
      save_flag = false
      cnt = BandDetail.where(user_id: current_user.id).count
      params_cnt = 0
      #params_cntはファイルの連番保存に必要
      params[:images].each do |image|


       @band_detail = BandDetail.new(band_detail_params)
        logger.debug("--------------------------band_detail_user_id=#{params[:band_detail][:user_id]}")
        logger.debug("--------------------------band_detail_file_exp=#{params[:band_detail][:file_exp]}")
      
        # @band_detail.user_id = user_id
          if image.inspect.include?("jpg") || image.inspect.include?("JPG") 
            @band_detail.file_type ="jpg"
          elsif image.inspect.include?("jpeg") || image.inspect.include?("JPEG")
            @band_detail.file_type = "jpeg"
          elsif image.inspect.include?("png") || image.inspect.include?("PNG")
            @band_detail.file_type = "png"
          elsif image.inspect.include?("mp4") || image.inspect.include?("MP4")
            @band_detail.file_type = "mp4"
          elsif image.inspect.include?("mov") || image.inspect.include?("MOV")
            @band_detail.file_type = "webm"
          elsif image.inspect.include?("m4v") || image.inspect.include?("M4V")
            @band_detail.file_type = "webm"
          end
          
          dir_path = "public/bands/#{@band_detail.user_id}"
          FileUtils.mkdir_p(dir_path) unless FileTest.exist?(dir_path)
          @band_detail.file_name = "#{@band_detail.user_id}-#{cnt+1}.#{@band_detail.file_type}"
          image = params[:images][params_cnt]
          File.binwrite("public/bands/#{@band_detail.user_id}/#{@band_detail.file_name}", image.read)
          cnt += 1
          params_cnt += 1
          # if cnt < 6
            @band_detail.save
            save_flag = true
          # else
          #   flash[:notice] = "Up to 5 files!"
          #   redirect_back(fallback_location: root_path)
          # end
      end  # end of each
      
        if save_flag
          flash[:notice] = "Media(s) successfully uploaded!"
          redirect_to user_url(id: @band_detail.user_id)
        else
          render new_band_detail_path
        end
        
    else
      flash[:notice] = "Up to 5 files!"
      redirect_back(fallback_location: root_path)
      #このフラッシュ緑（Succeeded!に見える）なので要変更
    end
    
    
  end
  # end of show
  
  def edit
    @band_detail = BandDetail.find(params[:id])
  end
  
  
  def update
    require 'fileutils'

    @band_detail = BandDetail.find(params[:id])
    ##".jpg", ".jpeg", ".png",".mp4", ".mov", ".m4v"拡張子部分削除したい
    
    @rpfile_name = @band_detail.file_name.split(".")[0] ##配列１個目だけ取り出す
    
    # if @band_detail.file_name.inspect.include?(".jpg")
    #   @replace_file_name = @band_detail.file_name.delete("j-g")
    # elsif @band_detail.file_name.inspect.include?(".jpeg")
    #   @replace_file_name = @band_detail.file_name.delete("j-g")
    # elsif @band_detail.file_name.inspect.include?(".png")
    #   @replace_file_name = @band_detail.file_name.delete("p-g")
    # elsif @band_detail.file_name.inspect.include?(".mp4")
    #   @replace_file_name = @band_detail.file_name.delete("m-4")
    # elsif @band_detail.file_name.inspect.include?(".mov")
    #   @replace_file_name = @band_detail.file_name.delete("m-v")
    # elsif @band_detail.file_name.inspect.include?(".m4v")
    #   @replace_file_name = @band_detail.file_name.delete("m-v")
    # end
    
    # if @band_detail.file_name.inspect.include?(".jpg")
    #   @replace_file_name = @band_detail.file_name.sub(/.jpg/, "")
    # elsif @band_detail.file_name.inspect.include?(".jpeg")
    #   @replace_file_name = @band_detail.file_name.sub(/.jpeg/, "")
    # elsif @band_detail.file_name.inspect.include?(".png")
    #   @replace_file_name = @band_detail.file_name.sub(/.png/, "")
    # elsif @band_detail.file_name.inspect.include?(".mp4")
    #   @replace_file_name = @band_detail.file_name.sub(/.mp4/, "")
    # elsif @band_detail.file_name.inspect.include?(".mov")
    #   @replace_file_name = @band_detail.file_name.sub(/.mov/, "")
    # elsif @band_detail.file_name.inspect.include?(".m4v")
    #   @replace_file_name = @band_detail.file_name.sub(/.m4v/, "")
    # end    
    # @replace_file_name = @band_detail.file_name.sub!(/..*/, "")
    
    # @replace_file_name = @band_detail.file_name.str.sub!(/..*/m, "")  ##拡張子部分削除したい
    # cnt = BandDetail.where(user_id: current_user.id).count ##要らないかも

    FileUtils.rm("public/bands/#{@band_detail.user_id}/#{@band_detail.file_name}") #既存ファイル削除
    

    if params[:band_detail][:file_name].inspect.include?("jpg") || params[:band_detail][:file_name].inspect.include?("JPG")
      @band_detail.file_type ="jpg"
    elsif params[:band_detail][:file_name].inspect.include?("jpeg") || params[:band_detail][:file_name].inspect.include?("JPEG")
      @band_detail.file_type = "jpeg"
    elsif params[:band_detail][:file_name].inspect.include?("png") || params[:band_detail][:file_name].inspect.include?("PNG")
      @band_detail.file_type = "png"
      logger.debug("-=============================== png 1125 ")

    elsif params[:band_detail][:file_name].inspect.include?("mp4") || params[:band_detail][:file_name].inspect.include?("MP4")
      @band_detail.file_type = "mp4"
    elsif params[:band_detail][:file_name].inspect.include?("mov") || params[:band_detail][:file_name].inspect.include?("MOV")
      logger.debug("-=============================== mov ")
      @band_detail.file_type = "webm"
    elsif params[:band_detail][:file_name].inspect.include?("m4v") || params[:band_detail][:file_name].inspect.include?("M4V")
      @band_detail.file_type = "webm"
    end
    
    
      # @band_detail.file_name = "#{@band_detail.user_id}-#{cnt+1}.#{@band_detail.file_type}" ##file_name連番ではなく上書きする
      @band_detail.file_name = "#{@rpfile_name}.#{@band_detail.file_type}"
      image = params[:band_detail][:file_name]
      File.binwrite("public/bands/#{@band_detail.user_id}/#{@band_detail.file_name}", image.read) ##ファイル保存する
    
      @band_detail.save
      flash[:notice] = "Media(s) successfully replcaed!"
      redirect_to user_url(id: @band_detail.user_id) ##render書かないと

  end
  
  
    # Nov 15    
    def destroy
      @band_detail = BandDetail.find(params[:id])
      @band_detail.destroy
      flash[:notice] = "Media(s) sccessfully deleted!"
        redirect_to users_path
      
    end

  private
    def band_detail_params
      params.require(:band_detail).permit(:user_id, :file_type, :file_name, :file_exp).merge(:user_id => current_user.id)
    end
    
    def ensure_correct_user
      @band_detail = BandDetail.find(params[:id])
      if @band_detail.user_id != current_user.id
        flash[:notice] = "You have no authority to access"
        redirect_to("/users")
      end
    end

end
