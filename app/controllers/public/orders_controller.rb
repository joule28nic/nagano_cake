class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @addresses = current_customer.addresses.all
  end

  def comfirm
    @order = Order.new(order_params)
    @addresses = Address.where(customer_id: current_customer.id)

    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.name

    elsif params[:order][:address_option] == "1"
      ship = @addresses.find(params[:order][:address_id])
      @order.postal_code = ship.postal_code
      @order.address = ship.address
      @order.name = ship.name

    elsif params[:order][:address_option] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]

    else
      render :new
    end

    @cart_items = current_customer.cart_items.all
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save

    current_customer.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.order_id = @order.id
      @order_detail.item_id = cart_item.id
      @order_detail.price = cart_item.item.with_tax_price
      @order_detail.amount = cart_item.amount
      @order_detail.save
    end
    current_customer.cart_items.destroy_all
    redirect_to complete_path
  end

  def complete
  end

  def index
  end

  def show
  end


  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end

end