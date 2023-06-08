FactoryBot.define do
  factory :customer_subscription do
    status { Faker::Number.within(range: 0..1) }
    association :customer, :subscription
  end
end
