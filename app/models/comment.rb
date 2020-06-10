class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :comment, presence:true,
                      length: { minimum: 2, maximum: 100 }
                      format: {
                      message: "は3文字以上で入力してください"
                      }
end
