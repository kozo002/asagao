class Admin::ProductsController < Admin::BaseController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /admin/products
  def index
    @products = Product.page(params[:page]).per(Product.per_page)
  end

  # GET /admin/products/:slug
  def show
  end

  # GET /admin/products/new
  def new
    @product = Product.new
  end

  # POST /admin/products
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to edit_admin_product_path(@product), notice: '製品を登録しました'
    else
      flash.now[:alert] = '製品を登録できませんでした'
      render :new
    end
  end

  # GET /admin/products/:slug/edit
  def edit
  end

  # PUT /admin/product/:slug
  def upadte
    if @product.update(product_params)
      redirect_to edit_admin_product_path(@product), notice: '製品を更新しました'
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
      params.require(:product).permit(Product.param_keys)
    end
end
