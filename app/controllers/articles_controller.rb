class ArticlesController < ApplicationController


  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save

        # 画像のアップロード対応
        if params[:images]
          params[:images].each { |image|
            @article.pictures.create(image: image)
          }
        end

        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end
  

  private
    def article_params
      params.require(:article).permit(:title, :description, :pictures)
    end

end
