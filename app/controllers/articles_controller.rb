class ArticlesController < ApplicationController

  #GET /articles
  def index
    @articles = Article.all
  end

  #GET /article/:id
  def show
    # find by id
    @article = Article.find(params[:id])
    # where ...
    # @article = Article.where(
    #             "id = ? AND title = ?",
    #             params[:id],
    #             params[:title]
    #           )
  end

  #GET /articles/new
  def new
    @article = Article.new
  end

  #POST /article/create
  def create
    @article = Article.new(article_params)
    # @article.valid?
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  #GET /article/:id/edit
  def edit
    @article = Article.find(params[:id])
  end

  #PUT /articles/:id/edit
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  # GET
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

end
