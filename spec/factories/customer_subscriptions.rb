FactoryBot.define do
  factory :customer_subscription do
   association :customer, :subscription
  end
end
