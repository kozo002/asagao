class ArticlesController < ApplicationController
  def index
    @articles = Article.order_desc.page(params[:page]).per(Article.per_page)
  end

  def show
    @article = Article.find_by_slug(params[:slug])
  end
end
