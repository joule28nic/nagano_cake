class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.page(params[:page]).per(10)
  end

  def show
  end

  def edit
  end

  def update
  end


  private

  def customer_params
    params.require(:customer).permit(:name, :last_name, :first_name, :email, :is_active)
  end

end
