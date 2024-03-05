class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(making_status: params[:order_detail][:making_status])
    order = @order_detail.order

    if params[:order_detail][:making_status] == "production"
      order.update(status: "producting")
    end

    if is_all_order_details_making_completed(order)
      order.update(status: "preparing")
    end

    redirect_to admin_order_path(order)
  end


  private

  def is_all_order_details_making_completed(order)
    order.order_details.each do |order_detail|
      if order_detail.making_status != 'complete'
        return false
      end
    end
    return true
  end

end