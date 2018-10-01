class Admin::OrdersController < ApplicationController
  before_action :load_order, only: %i(edit destroy)

  def index
    @orders = Order.select_newest.paginate page: params[:page],
      per_page: Settings.controller.admin.user.per_page
  end

  def edit; end

  def update; end

  def destroy
    if @order.destroy
      flash[:success] = t ".success"
      redirect_to admin_orders_path
    else
      flash[:danger] = t ".danger"
      redirect_to admin_orders_path
    end
  end

  private

  def load_order
    @order = Order.find_by id: params[:id]
  end
end
