FactoryBot.define do


  factory :item do
    id              {1}
    name            {"名前"}
    introduction    {"説明"}
    price           {1111}
    brand           {}
    item_condition  {1}
    postage_payer   {1}
    prefecture_code {1}
    preparation_day {1}
    postage_type    {1}
    category_id     {1}
    seller_id       {1}
  end



end