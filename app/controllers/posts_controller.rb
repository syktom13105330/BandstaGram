class PostsController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    @posts = Post.all.order(id: "desc")
      
  end
  
  def new
    @post = Post.new
  end
  
  def create
    require 'fileutils'
    # logger.debug("--------------------------file_name=#{params[:post][:file_name]}")
    
    @post = Post.new(post_params)
    
    if @post.save
        post_id = Post.last.id

      
          # 画像のアップロード対応
    
          if params[:images]
             save_flag = false
             cnt = 0
             params[:images].each { |image|
             
              @post_detail = PostDetail.new(post_detail_params)
              @post_detail.post_id = post_id
              
              # 松下さん
              if image.inspect.include?("jpg")
                @post_detail.file_type = "jpg"
              elsif image.inspect.include?("jpeg")
                @post_detail.file_type = "jpeg"
              elsif image.inspect.include?("png")
                @post_detail.file_type = "png"
              elsif image.inspect.include?("mp4")
                @post_detail.file_type = "mp4"
              elsif image.inspect.include?("mov")
                @post_detail.file_type = "mov"
              elsif image.inspect.include?("m4v")
                @post_detail.file_type = "m4v"
              end
              
              # @post_detail.file_type = "p"
              logger.debug("--------------------------file_name=#{image.inspect.include?("jpg")}")
              
              dir_path = "public/pics/#{post_id}"
              FileUtils.mkdir_p(dir_path) unless FileTest.exist?(dir_path)
              @post_detail.file_name = "#{@post.id}-#{cnt+1}.#{@post_detail.file_type}"
              image = params[:images][cnt]
              File.binwrite("public/pics/#{post_id}/#{@post_detail.file_name}", image.read)
              cnt += 1
              
              @post_detail.save
              save_flag = true
             }
          
              if save_flag
                flash[:notice] = "Your post saved successfully"
                redirect_to posts_path
              else 
                render new_post_path
              end
          end
      
      
    else
      render new_post_path
    end
      
  end
  
  def show
    # logger.debug("============================= params[:id] = #{params[:id]}")
    @post = Post.find(params[:id])
    @post_details = PostDetail.where(post_id: params[:id])

  end
  
  #Nov_13
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
      redirect_to posts_path
  end
  
  private 
    def post_params
      params.require(:post).permit(:writer_id, :content).merge(:writer_id => current_user.id)
    end
    
    def post_detail_params
      params.require(:post).permit(:file_name, :post_id)
    end
end  ## class end


