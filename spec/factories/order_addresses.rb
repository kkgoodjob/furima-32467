FactoryBot.define do
  factory :order_address do
    postal_code   { '123-4567' }
    prefecture_id { '2' }
    municipality  { 'あ' }
    house_number  { 'あ' }
    phone_number  { '00000000000' }
  end
end
