FactoryBot.define do
  factory :tea do
    title { Faker::Ancient.primordial }
    description { Faker::GreekPhilosophers.quote }
    temperature { Faker::Number.within(range: 70..100) }
    brew_time { Faker::Number.within(range: 1..10) }
  end
end
