class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer)
    else
      render edit_admin_customer_path(@customer)
    end
  end


  private

  def customer_params
    params.require(:customer).permit(:name, :last_name, :first_name, :email, :is_active)
  end

end
