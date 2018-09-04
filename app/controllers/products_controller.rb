class ProductsController < ApplicationController
  def index
    @products = Product.joins_images.order_by_newest
  end

  def show; end
end
