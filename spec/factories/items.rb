FactoryBot.define do
  factory :item do
    name { Faker::Name.initials(number: 1) }
    explanation { Faker::Lorem.sentence }
    category_id { rand(2..11) }
    condition_id { rand(2..7) }
    shipping_fee_burden_id { rand(2..3) }
    prefecture_id { rand(2..48) }
    days_to_ship_id { rand(2..4) }
    price { rand(300..9_999_999) }
    association :user
  end
end
