class ItemsController < ApplicationController
  def index
    @items = Item.all.order('id ASC').limit(3)
  end

  def new 
    @item =Item.new
    @item.item_imgs.build
  end

  def show
    @items = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(
    :name, :introduction, :price,
    :brand, :item_condition, 
    :postage_payer, :prefecture_code,
    :preparation_day, :postage_type, :category_id,
    item_imgs_attributes: [:url, :_destroy, :id]).merge(seller_id: current_user.id)
  end
end


