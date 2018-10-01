class OrderDetailsController < ApplicationController
  def create
    if session[:user_id].present?
      ActiveRecord::Base.transaction do
        @order = Order.new(user_id: current_user.id,
         order_date: Time.zone.now,
         total: params[:total])
        all_save_from_cart @order
        redirect_to root_path
      end
    else
      ActiveRecord::Base.transaction do
        @order = Order.new(user_id: Settings.user_id_default_for_guest, order_date: Time.zone.now, total: params[:total])
        @order.update_attributes order_params
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
    if @order.save
      add_order_details @order
      destroy_session_cart
      flash[:success] = t "controllers.order_detail.create.success"
    else
      redirect_to root_paths
      flash[:danger] = t "controllers.order_detail.create.danger"
  end

  private

  def order_params
      params.require(:order_detail).permit :name, :phone, :email, :address
  end
end
