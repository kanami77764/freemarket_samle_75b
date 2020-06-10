FactoryBot.define do

  factory :user do
    name                  {Faker::Name.name}
    email                 {Faker::Internet.email}
    password              {"password0"}
    password_confirmation {"password0"}
  end
end