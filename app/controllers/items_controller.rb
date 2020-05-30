class ItemsController < ApplicationController
  def index
    @items = Item.all.order('id ASC').limit(3)
  end

  def new 
    @category = Category.where(ancestry: "").limit(13)
  end

  def get_category_children  
    @category_children = Category.find(params[:parent_id]).children 
    end
 
  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
    end
  
  def show
    @items = Item.find(params[:id])
    @grandchild = Category.find(@items.category_id)
    @child = @grandchild.parent
    @parent = @child.parent
  end

  def destroy
    @items = Item.find(params[:id])
    @items.destroy
    redirect_to root_path
    
  end
  

  private
  def item_params
    params.require(:item).permit(:name, :price)
  end
end


