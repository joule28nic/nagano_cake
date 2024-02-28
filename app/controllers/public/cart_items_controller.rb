class Public::CartItemsController < ApplicationController
  def index
  end

  def create
    binding.pry
  end

  def update
  end

  def destroy
  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end
