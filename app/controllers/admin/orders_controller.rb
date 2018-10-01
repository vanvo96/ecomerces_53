class Admin::OrdersController < ApplicationController
  before_action :load_order, only: %i(edit destroy)

  def index
    @orders = Order.ordered_by_name.paginate page: params[:page],
      per_page: Settings.controller.admin.user.per_page
  end

  def edit; end

  def update; end

  def destroy
    if @order.destroy
      flash[:success] = t "controllers.admin.order.destroy.success"
      redirect_to admin_orders_path
    else
      flash[:danger] = t "controllers.admin.order.destroy.danger"
      redirect_to admin_orders_path
    end
  end

  private

  def load_order
    @order = Order.find_by id: params[:id]
    if @order.user_id.blank?
      if @order.destroy
        flash[:success] = t "controllers.admin.order.destroy.success"
        redirect_to admin_orders_path
      end
    end
  end
end
