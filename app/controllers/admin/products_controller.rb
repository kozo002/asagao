class Admin::ProductsController < Admin::BaseController
  before_action :set_product, only: [:edit, :update, :destroy]
  helper_method :categories_for_select

  # GET /admin/products
  def index
    @products = Product.page(params[:page]).per(Product.per_page)
  end

  # GET /admin/products/new
  def new
    @product = Product.new
  end

  # POST /admin/products
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path, notice: '製品を登録しました'
    else
      flash.now[:alert] = '製品を登録できませんでした'
      render :new
    end
  end

  # GET /admin/products/:slug/edit
  def edit
  end

  # PUT /admin/product/:slug
  def update
    if @product.update(product_params)
      redirect_to admin_products_path, notice: '製品を更新しました'
    else
      flash[:alert] = '製品を更新できませんでした'
      render :edit
    end
  end

  # DELETE /admin/products/:slug
  def destroy
    @product.destroy
    redirect_to admin_products_path, notice: '製品を削除しました'
  end

  private
    def set_product
      @product = Product.find_by_slug(params[:slug])
    end

    def product_params
      params.require(:product).permit(Product.param_keys).merge(
        publish_flag: !!params[:commit].match(/公開/)
      )
    end

    def categories_for_select
      @categories ||= Category.arrange_as_array(order: :position)
    end
end
