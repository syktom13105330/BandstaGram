class PostsController < ApplicationController

  
  before_action :authenticate_user!
  
  def index
    @posts = Post.all
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
              @post_detail.file_type = "p"
              logger.debug("--------------------------file_name=#{image}")
              
              dir_path = "public/pics/#{post_id}"
              FileUtils.mkdir_p(dir_path) unless FileTest.exist?(dir_path)
              @post_detail.file_name = "#{@post.id}-#{cnt+1}.jpg"
              image = params[:images][cnt]
              File.binwrite("public/pics/#{post_id}/#{@post_detail.file_name}", image.read)
              cnt += 1
              
              @post_detail.save
              save_flag = true
             }
          
              if save_flag
                flash[:notice] = "success save detail"
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
    logger.debug("============================= params[:id] = #{params[:id]}")
    @post = Post.find(params[:id])
    @post_details = PostDetail.where(post_id: params[:id])
  end
  
  private 
    def post_params
      params.require(:post).permit(:writer_id, :content).merge(:writer_id => current_user.id)
    end
    
    def post_detail_params
      params.require(:post).permit(:file_name)
    end
end  ## class end


