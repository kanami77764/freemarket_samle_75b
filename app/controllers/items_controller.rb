class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  
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

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end


