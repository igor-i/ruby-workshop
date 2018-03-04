class ArticleCategoriesController < ApplicationController
  def index
    # @categories = Article::Category.all
    @q = Article::Category.ransack(params[:q])
    @categories = @q.result(distinct: true).page(params[:page])
  end

  def show
    @category = Article::Category.find(params[:id])
  end

  def new
    @category = Article::Category.new
  end

  def edit
    @category = Article::Category.find(params[:id])
  end

  def create
    @category = Article::Category.new(category_params)

    if @category.save
      redirect_to article_categories_path
    else
      render 'new'
    end
  end

  def update
    @category = Article::Category.find(params[:id])

    if @category.update(category_params)
      redirect_to article_categories_path
    else
      # binding.irb
      render 'edit'
    end
  end

  def destroy
    @category = Article::Category.find(params[:id])
    @category.destroy

    redirect_to article_categories_path
  end

  def category_params
    params.require(:article_category).permit(:name, :slug)
  end
end
