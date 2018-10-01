class OrderDetailsController < ApplicationController
  def create
    if session[:user_id].present?
      ActiveRecord::Base.transaction do
        @order = Order.new(user_id: session[:user_id],
         order_date: Time.zone.now,
         total: params[:total])
        all_save_from_cart @order
        redirect_to root_path
      end
    else
      ActiveRecord::Base.transaction do
        @order = Order.new(user_id: Settings.user_id_default_for_guest, order_date: Time.zone.now,
          total: params[:total], name: params[:order_detail][:name],
          phone: params[:order_detail][:phone],
          email: params[:order_detail][:email],
          address: params[:order_detail][:address])
        all_save_from_cart @order
        redirect_to root_path
      end
    end
  end

  def destroy_session_cart
    session.delete(:cart)
  end

  def add_order_details _order
    session[:cart].each do |key, value|
      product = Product.find_by id: key.to_i
      total_price = value.to_i * product.price
      @order_details = @order.order_details.create(product_id: key,
        quantity: value, total_price: total_price)
    end
  end

  def all_save_from_cart _order
    @order.save
    add_order_details @order
    destroy_session_cart
    flash[:success] = t "controllers.order_detail.create.success"
  end
end
