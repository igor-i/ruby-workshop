class ArticlesController < ApplicationController

  # http_basic_authenticate_with name: "test", password: "test", except: [:index, :show]

  def index
    @q = Article.ransack(params[:q])
    @articles = @q.result(distinct: true).page(params[:page])
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      # binding.irb
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  def article_params
    params.require(:article).permit(:title, :text, :author_name, :state, :article_category_id)
  end
end
