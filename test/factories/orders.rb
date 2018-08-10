FactoryBot.define do
  factory :order do
    amount_edin 10
    price_euro 1.5
    total_euro 15
    oid '45356456'
    closed false
    client nil
  end
end
