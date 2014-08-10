class Admin::CategoriesController < Admin::BaseController
  before_action :set_category, only: [:edit, :update, :destroy, :higher, :lower]

  # GET /admin/categories
  def index
    @categories = Category.arrange(order: :position)
  end

  # GET /admin/categories/new
  def new
    @category = Category.new(parent_id: params[:parent_id])
  end

  # POST /admin/categories
  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to edit_path, notice: '作成しました'
    else
      flash.now[:alert] = '作成できませんでした'
      render :new
    end
  end

  # GET /admin/categories/:slug/edit
  def edit
  end

  # PUT /admin/categories/:slug
  def update
    if @category.update(category_params)
      redirect_to edit_path, notice: '更新しました'
    else
      flash.now[:alert] = '更新できませんでした'
      render :edit
    end
  end

  # DELETE /admin/categories/:slug
  def destroy
    @category.destroy
    redirect_to admin_categories_path, notice: '削除しました'
  end

  # PUT /admin/categories/:category_slug/higher
  def higher
    @category.move_higher
    redirect_to admin_categories_path, notice: '順序を上げました'
  end

  # PUT /admin/categories/:category_slug/lower
  def lower
    @category.move_lower
    redirect_to admin_categories_path, notice: '順序を下げました'
  end

  private
    def set_category
      @category = Category.find_by_slug(params[:slug] || params[:category_slug])
    end

    def category_params
      params.require(:category).permit(Category.param_keys)
    end

    def edit_path
      edit_admin_category_path(@category)
    end
end
