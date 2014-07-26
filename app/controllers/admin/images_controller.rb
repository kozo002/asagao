class Admin::ImagesController < Admin::BaseController
  before_action :set_image, only: [:edit, :update, :destroy]

  # GET /admin/images
  def index
    @images = Image.order_desc.page(params[:page]).per(Image.per_page)
    @image = Image.new
  end

  # POST /admin/images
  def create
    @image = Image.new(image_params)
    message = if @image.save
      { notice: '画像をアップロードしました' }
    else
      { alert: '画像をアップロードできませんでした' }
    end
    redirect_to :back, message
  end

  # GET /admin/images/:id/edit
  def edit; end

  # PUT /admin/images/:id
  def update
    message = if @image.update(image_params)
      { notice: '画像を更新しました' }
    else
      { alert: '画像を更新できませんでした' }
    end
    redirect_to :back, message
  end

  # DELETE /admin/images/:id
  def destroy
    @image.destroy
    redirect_to :back, notice: '画像を削除しました'
  end

  private
    def image_params
      params.require(:image).permit(Image.param_keys)
    end

    def set_image
      @image = Image.find(params[:id])
    end
end
