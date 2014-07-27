class ProductsController < ApplicationController
  def index
    @products = Product.order_desc.page(params[:page]).per(Product.per_page)
  end

  def show
    @rpdict = Product.find_by_slug(params[:slug])
  end
end
