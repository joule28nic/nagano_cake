class Public::ItemsController < ApplicationController

  def index
    @genres = Genre.all
    # if params[:item.name]
      # @items = Item.page(params[:page]).per(8).reverse_order.includes(:item.name)
    # else
      @items = Item.page(params[:page]).per(8).reverse_order
    # end
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item =CartItem
  end


  private

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price, :genre_id, :is_active)
  end

end
