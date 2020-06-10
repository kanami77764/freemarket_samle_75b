FactoryBot.define do
  factory :comment do
    id              {1}
    item_id         {1}
    user_id         {1}
    comment         {22}
  end
end
