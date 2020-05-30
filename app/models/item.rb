class Item < ApplicationRecord
  
  # コンフリクト時にバリデーションを復活させる

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :item_imgs, dependent: :destroy
  belongs_to :category, foreign_key: true
  belongs_to :user, foreign_key: 'user_id'
end
