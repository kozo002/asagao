class Admin::Products::ImagesController < Admin::BaseController
  before_action :set_product

  def index
    @images = @product.images
    @image = ProductImage.new
  end

  def create
    @product.images << ProductImage.new(product_image_params)
    redirect_to index_path, notice: '製品画像を登録しました'
  end

  def destroy
    @product.images.destroy(params[:id])
    redirect_to index_path, notice: '製品画像を削除しました'
  end

  private
    def set_product
      @product = Product.find_by_slug(params[:product_slug])
    end

    def product_image_params
      params.require(:product_image).permit(ProductImage.param_keys)
    end

    def index_path
      admin_product_images_path(@product)
    end
end
