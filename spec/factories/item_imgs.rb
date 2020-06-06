FactoryBot.define do

  factory :item_img do  
    url              {Rack::Test::UploadedFile.new(Rails.root.join('spec/factories/test.jpeg'), 'spec/factories/test.jpeg')}
    item_id          {1}
  end
end