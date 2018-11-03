class PostsController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
    logger.debug("--------------------------file_name=#{params[:post][:file_name]}")
    
    @post = Post.create(params.require(:post).permit(:writer_id,:writer_type, :content, :private_flag, :file_type, :file_name).merge(:writer_id => current_user.id))
    
    if params[:post][:file_name]
      @post.file_name = "#{@post.id}.jpg"
      image = params[:post][:file_name]
      File.binwrite("public/pics/#{@post.file_name}", image.read)
    end
    if @post.save
      flash[:notice] = "New post created!"
      redirect_to("/posts")
    else
      render new_post_path
    end
      
  end
  
  def show
    @post = Post.find(params[:id])
  end
end


