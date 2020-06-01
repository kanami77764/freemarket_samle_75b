class ItemImg < ApplicationRecord
  belongs_to :item, optional: true
  mount_uploader :url, ItemImgUploader
end
