class CommentsController < ApplicationController
  def create
      @item =Item.find(params[:item_id])
      @comment = Comment.create(comment_params)
      @comment.user_id = current_user.id
      if @comment.save
        respond_to do |format|
          format.html { redirect_to item_path(@comment.item.id) }
          format.json
        end
      end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    if @comment.destroy
       redirect_to item_path(@comment.item.id)
    end
  end
  
  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
  

