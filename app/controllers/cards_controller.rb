class CardsController < ApplicationController
  require "payjp"
  before_action :set_card

  def new
    if user_signed_in?
      card = Card.where(user_id: current_user.id)
      redirect_to users_path(current_user.id) if card.exists?
    else
      redirect_to user_session_path
    end
  end

  def pay #payjpとCardのデータベース作成(チームのための記述です)
    Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) 
      @user_card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @user_card.save
        redirect_to card_path(current_user.id)
      else
        redirect_to action: "pay"
      end
    end
  end

  def destroy
    if @card.present?
      Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.delete
    end
      redirect_to users_path (current_user)
  end

  def show 
    if @card.blank?
      redirect_to action: "new" 
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

  private
  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end
end


