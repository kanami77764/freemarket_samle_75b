class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :comment, presence: true,
                      length: { minimum: 3, maximum: 100 }
end
