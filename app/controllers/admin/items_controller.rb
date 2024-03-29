class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @genres = Genre.all
    # if params[:item_name]
      # @items = Item.page(params[:page]).per(10).includes(:item_name)
    # else
      @items = Item.page(params[:page]).per(10)
    # end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item)
    else
      render edit_admin_item_path(@item)
    end
  end


  private

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price, :genre_id, :is_active)
  end

end
