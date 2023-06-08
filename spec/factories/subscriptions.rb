FactoryBot.define do
  factory :subscription do
    title { Faker::Books::Lovecraft.deity}
    price { Faker::Number.decimal(l_digits: 2) }
    frequency { Faker::Number.within(range: 1..4) }
  end
end
