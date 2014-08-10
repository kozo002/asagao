class Admin::CategoriesController < Admin::BaseController
  before_action :set_category, only: [:edit, :update, :destroy]

  # GET /admin/categories
  def index
    @categories = Category.arrange
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

  private
    def set_category
      @category = Category.find_by_slug(params[:slug])
    end

    def category_params
      params.require(:category).permit(Category.param_keys)
    end

    def edit_path
      edit_admin_category_path(@category)
    end
end
