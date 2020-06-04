class BuyersController < ApplicationController
  require 'payjp'
  before_action :set_card, :set_item, :set_send

  def index #購入確認確認(チームへのコメント)
    @items = Item.find(params[:item_id])
      if  @card.blank?
          redirect_to require_make_card_cards_path
      else
          Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
          customer = Payjp::Customer.retrieve(@card.customer_id)
          @default_card_information = customer.cards.retrieve(@card.card_id)

          @exp_month = @default_card_information.exp_month.to_s
          @exp_year = @default_card_information.exp_year.to_s.slice(2,3)

          @card_brand = @default_card_information.brand
          case @card_brand
          when "Visa"
            @card_src = "Visa.svg"
          when "JCB"
            @card_src = "JCB.svg.png"
          when "MasterCard"
            @card_src = "Master.svg.png"
          when "American Express"
            @card_src = "amex.svg"
          when "Diners Club"
            @card_src = "Diners.png"
          when "Discover"
            @card_src = "discover.png"
          end
      end
  end
  
  def pay #商品購入（チームへのコメントアウト。viewsなし）
    Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
    Payjp::Charge.create(
      amount: @items.price,
      customer: Payjp::Customer.retrieve(@card.customer_id),
      currency: 'jpy',
    )
    @items.update(buyer_id: current_user.id)
    redirect_to action: 'done'
  end
  

  private
  def item_params
    params.require(:item).permit(
      :name,
      :price,
    ).merge(user_id: current_user.id)
  end
  def set_item
    @items = Item.find(params[:item_id])
  end

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

  def set_send
    @send_id = SendingDestination.where(user_id: current_user.id).first
  end
  
end
