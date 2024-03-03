class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(status: params[:order][:status])
    order_details = @order.order_details.all

    if params[:order][:status] == "paid_up"
      order_details.update(making_status: "waiting")
    end

    redirect_to admin_order_path(@order)
  end

end
