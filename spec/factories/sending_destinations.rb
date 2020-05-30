FactoryBot.define do

  factory :sending_destination do
    destination_first_name                 {"梨華"}
    destination_family_name                {"有吉"}
    destination_first_name_kana            {"リカ"}
    destination_family_name_kana           {"アリヨシ"}           
    post_code                              {"112-1134"}
    prefecture_code                        {"福岡県"}                    
    city                                   {"福岡市"}
    house_number                           {"博多区112"}
  end

end