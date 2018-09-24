class OrderDetailsController < ApplicationController
  def create
    if session[:user_id].present?
      ActiveRecord::Base.transaction do
        @order = Order.new(user_id: session[:user_id], order_date: Time.zone.now,
         total: params[:total])
        @order.save
        session[:cart].each do |key, value|
          @order_details = @order.order_details.create(product_id: key,
           quantity: value)
          product = Product.find_by id: key
          total_price = @order_details.quantity * product.price
          @order_details.update_attributes(total_price: total_price)
        end
      end
      destroy_session_cart
      flash[:success] = t "controllers.order_detail.create.success"
      redirect_to root_path
    else
      flash[:danger] = t "controllers.order_detail.create.danger"
      redirect_to root_path
    end
  end

  def destroy_session_cart
    session.delete(:cart)
  end
end
