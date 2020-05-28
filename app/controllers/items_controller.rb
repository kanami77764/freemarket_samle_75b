class ItemsController < ApplicationController
  def index
    @items = Item.all.order('id ASC').limit(3)
    # @item_imgs = ItemImg.all
  end

  def new 
  end

  def show
    @items = Item.find(params[:id])
    # @item_imgs = ItemImg.find(params[:id])
    # @item_imgs = @items.item_imgs
  end

  private
  def item_params
    params.require(:item).permit(:name, :price)
  end
end


