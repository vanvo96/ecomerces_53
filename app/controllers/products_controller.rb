class ProductsController < ApplicationController
  def index
    @products = Product.joins_images.order_by_newest
    @search = Product.search(params[:q])
    @products = @search.result
  end

  def show; end
end
