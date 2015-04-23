class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  layout 'dynamic'

  respond_to :html

  def index
    @articles = Article.all
    respond_with(@articles)
  end

  def show
    respond_with(@article)
  end

  def new
    @article = Article.new
    respond_with(@article)
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    if @article.save
    redirect_to articles_path
    else
      render 'new'
    end
  end

  def update
    @article.update(article_params)
    respond_with(@article)
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :body, :image)
    end
end
