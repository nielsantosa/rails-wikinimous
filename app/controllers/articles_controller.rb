class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    strong_params = params.require(:article).permit(:title, :content)

    @article = Article.new(strong_params)

    if @article.save!
      redirect_to article_path(@article.id)
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    strong_params = params.require(:article).permit(:title, :content)

    if @article.update!(strong_params)
      redirect_to article_path(@article.id)
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end
end
