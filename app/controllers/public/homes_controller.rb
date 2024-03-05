class Public::HomesController < ApplicationController

  def top
    @genres = Genre.all
    @items = Item.limit(4).reverse_order
  end

  def about
  end

end
