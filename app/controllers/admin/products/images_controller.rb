class Admin::Products::ImagesController < Admin::BaseController
  before_action :set_product
  before_action :set_image, only: [:higher, :lower]

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

  def higher
    @image.attachment.move_higher
    redirect_to :back, notice: '製品画像の順序を上げました'
  end

  def lower
    @image.attachment.move_lower
    redirect_to :back, notice: '製品画像を順序を下げました'
  end

  private
    def set_product
      @product = Product.find_by_slug(params[:product_slug])
    end

    def set_image
      @image = @product.images.find(params[:image_id])
    end

    def product_image_params
      params.require(:product_image).permit(ProductImage.param_keys)
    end

    def index_path
      admin_product_images_path(@product)
    end
end
