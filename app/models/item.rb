class Item < ApplicationRecord
  validates :name, :introduction, :price, :item_condition, :postage_payer, :prefecture_code, :size, :preparation_day :postage_type, :category, :trading_status, :seller ,null:false
  validates :name, length:{maximum:40}
  validates :introduction, length{maximum:1000}

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :item_imgs, dependent: :destroy
  belongs_to :category
  belongs_to :user
end
