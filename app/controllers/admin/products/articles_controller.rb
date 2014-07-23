class Admin::Products::ArticlesController < Admin::BaseController
  before_action :set_product
  before_action :set_article, only: [:edit, :update, :destroy]

  # GET /admin/products/:product_slug/articles
  def index
    @articles = @product.articles.page(params[:page]).per(Article.per_page)
  end

  # GET /admin/products/:product_slug/articles/new
  def new
    @article = @product.articles.build
  end

  # POST /admin/products/:product_slug/articles
  def create
    @article = @product.articles.build(article_params)
    if @article.save
      redirect_to edit_path, notice: '記事を作成しました'
    else
      flash.now[:alert] = '記事を作成できませんでした'
      render :new
    end
  end

  # GET /admin/products/:product_slug/articles/:slug/edit
  def edit
  end

  # PUT /admin/products/:product_slug/articles/:slug
  def update
    if @article.update(article_params)
      redirect_to edit_path, notice: '記事を更新しました'
    else
      flash.now[:alert] = '記事を更新できませんでした'
      render :edit
    end
  end

  # DELETE /admin/products/:product_slug/articles/:slug
  def destroy
    @article.destroy
    redirect_to admin_product_articles_path, notice: '記事を削除しました'
  end

  private
    def set_product
      @product = Product.find_by(slug: params[:product_slug])
    end

    def set_article
      @article = @product.articles.find_by_slug(params[:slug])
    end

    def article_params
      params.require(:article).permit(Article.param_keys).merge(
        publish_flag: !!params[:commit].match(/公開/)
      )
    end

    def edit_path
      edit_admin_product_article_path(@product, @article)
    end
end
