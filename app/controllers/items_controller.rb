class ItemsController < ApplicationController

  before_action :move_to_index, except: [:index, :show, :require_login]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.all.order('id DESC').limit(10)
  end

  def new 
    @item =Item.new
    @item.item_imgs.build
    @category = Category.where(ancestry: "").limit(13)

  end

  def get_category_children  
    @category_children = Category.find(params[:parent_id]).children 
    end
 
  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
    end
  
  def show
    @seller = @items.seller.name
    @grandchild = Category.find(@items.category_id)
    @child = @grandchild.parent
    @parent = @child.parent
    @items = Item.find(params[:id])
    @comment = Comment.new
    @comments = @items.comments.includes(:user)
    @comments = @items.comments.order(created_at: :desc)
  end


  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @item.item_imgs.build
      render :new
    end
  end

  def edit
    @grandchild = Category.find(@items.category_id)
    @child = @grandchild.parent
    @parent = @child.parent
  end

  def update
    if  
      @items.update(item_params)
      redirect_to item_path
    else
      @grandchild = Category.find(@items.category_id)
      @child = @grandchild.parent
      @parent = @child.parent
      render :edit
    end
  end
  
  def destroy
    @items = Item.find(params[:id])
    @items.destroy
    redirect_to root_path  
  end

  def search
    @items = Item.search(params[:keyword])
  end

  def require_login
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

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

  def set_item
    @items = Item.find(params[:id])
  end
end


