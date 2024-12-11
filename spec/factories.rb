FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end

  factory :room do
    capacity { 2 }
    price_per_night { 100 }
    association :hotel
  end

  factory :hotel do
    name { Faker::Movies::StarWars.planet }
    address { Faker::Address.full_address }
  end
end
