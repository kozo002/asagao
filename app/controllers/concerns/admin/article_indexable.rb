module Admin::ArticleIndexable
  extend ActiveSupport::Concern

  def index
    @articles = article_source.page(params[:page]).per(Article.per_page)
  end

  def article_source
    if @product.present?
      @product.articles
    else
      Article
    end
  end
end
