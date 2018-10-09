module CartsHelper
  def quantity_in_carts
    quantity = 0
    session[:cart].each do |_key, value|
      quantity += value
    end
    quantity
  end

  def total_order
    products = Product.select_product_by_array_id session[:cart].keys
    total_price_order = 0
    products.each do |item|
      total_price_order += item.price * session[:cart][item.id.to_s]
    end
    total_price_order
  end

  def check_session
    session[:out_of_stock].present?
  end
end
