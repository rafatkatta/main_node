FactoryBot.define do
  factory :client do
    email "mymail@gmail.com"
    domain "http://gmail.com"
    ipv4 nil
    ipv6 nil
    uuid nil
    secret_key nil
  end
end
