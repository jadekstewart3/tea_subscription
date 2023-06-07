FactoryBot.define do
  factory :subscription_tea do
    association :tea, :subscription
  end
end
