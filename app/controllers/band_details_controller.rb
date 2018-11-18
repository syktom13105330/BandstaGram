class BandDetailsController < ApplicationController

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
          if image.inspect.include?("jpg")
            @band_detail.file_type ="jpg"
          elsif image.inspect.include?("jpeg")
            @band_detail.file_type = "jpeg"
          elsif image.inspect.include?("png")
            @band_detail.file_type = "png"
          elsif image.inspect.include?("mp4")
            @band_detail.file_type = "mp4"
          elsif image.inspect.include?("mov")
            @band_detail.file_type = "mov"
          elsif image.inspect.include?("m4v")
            @band_detail.file_type = "m4v"
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
    


end
