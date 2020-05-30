class ItemsController < ApplicationController
  def index
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
    @item = Item.find(2)
    @grandchild = Category.find(@item.category_id)
    @child = @grandchild.parent
    @parent = @child.parent
  end
end
