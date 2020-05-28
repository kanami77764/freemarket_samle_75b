class ItemsController < ApplicationController
  def index
    @items = Item.all.order('id ASC').limit(3)
  end

  def new 
  end

  def show
    @items = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:name, :price)
  end
end


