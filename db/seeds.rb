# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


customer_1 = FactoryBot.create(:customer)
customer_2 = FactoryBot.create(:customer)
customer_3 = FactoryBot.create(:customer)

subscription_1 = FactoryBot.create(:subscription)
subscription_2 = FactoryBot.create(:subscription)
subscription_3 = FactoryBot.create(:subscription)
subscription_4 = FactoryBot.create(:subscription)
subscription_5 = FactoryBot.create(:subscription)
subscription_6 = FactoryBot.create(:subscription)


tea_1 = FactoryBot.create(:tea)
tea_2 = FactoryBot.create(:tea)
tea_3 = FactoryBot.create(:tea)
tea_4 = FactoryBot.create(:tea)
tea_5 = FactoryBot.create(:tea)
tea_6 = FactoryBot.create(:tea)
tea_7 = FactoryBot.create(:tea)
tea_8 = FactoryBot.create(:tea)

SubscriptionTea.create!(tea_id: tea_1.id, subscription_id: subscription_1.id)
SubscriptionTea.create!(tea_id: tea_1.id, subscription_id: subscription_2.id)
SubscriptionTea.create!(tea_id: tea_1.id, subscription_id: subscription_3.id)

SubscriptionTea.create!(tea_id: tea_2.id, subscription_id: subscription_3.id)
SubscriptionTea.create!(tea_id: tea_2.id, subscription_id: subscription_1.id)

SubscriptionTea.create!(tea_id: tea_3.id, subscription_id: subscription_3.id)
SubscriptionTea.create!(tea_id: tea_3.id, subscription_id: subscription_4.id)
SubscriptionTea.create!(tea_id: tea_3.id, subscription_id: subscription_5.id)

SubscriptionTea.create!(tea_id: tea_4.id, subscription_id: subscription_1.id)
SubscriptionTea.create!(tea_id: tea_4.id, subscription_id: subscription_2.id)
SubscriptionTea.create!(tea_id: tea_4.id, subscription_id: subscription_3.id)
SubscriptionTea.create!(tea_id: tea_4.id, subscription_id: subscription_4.id)

SubscriptionTea.create!(tea_id: tea_5.id, subscription_id: subscription_4.id)
SubscriptionTea.create!(tea_id: tea_5.id, subscription_id: subscription_5.id)
SubscriptionTea.create!(tea_id: tea_5.id, subscription_id: subscription_6.id)

SubscriptionTea.create!(tea_id: tea_6.id, subscription_id: subscription_6.id)
SubscriptionTea.create!(tea_id: tea_6.id, subscription_id: subscription_5.id)
SubscriptionTea.create!(tea_id: tea_6.id, subscription_id: subscription_4.id)
SubscriptionTea.create!(tea_id: tea_6.id, subscription_id: subscription_3.id)
SubscriptionTea.create!(tea_id: tea_6.id, subscription_id: subscription_1.id)

SubscriptionTea.create!(tea_id: tea_7.id, subscription_id: subscription_1.id)
SubscriptionTea.create!(tea_id: tea_7.id, subscription_id: subscription_4.id)
SubscriptionTea.create!(tea_id: tea_7.id, subscription_id: subscription_6.id)

SubscriptionTea.create!(tea_id: tea_8.id, subscription_id: subscription_1.id)
SubscriptionTea.create!(tea_id: tea_8.id, subscription_id: subscription_2.id)
SubscriptionTea.create!(tea_id: tea_8.id, subscription_id: subscription_3.id)
SubscriptionTea.create!(tea_id: tea_8.id, subscription_id: subscription_4.id)

CustomerSubscription.create!(customer_id: customer_1.id, subscription_id: subscription_1.id, status: 0)
CustomerSubscription.create!(customer_id: customer_1.id, subscription_id: subscription_2.id, status: 1)
CustomerSubscription.create!(customer_id: customer_1.id, subscription_id: subscription_3.id, status: 0)

CustomerSubscription.create!(customer_id: customer_2.id, subscription_id: subscription_3.id, status: 0)
CustomerSubscription.create!(customer_id: customer_2.id, subscription_id: subscription_4.id, status: 1)

CustomerSubscription.create!(customer_id: customer_3.id, subscription_id: subscription_4.id, status: 0)
CustomerSubscription.create!(customer_id: customer_3.id, subscription_id: subscription_5.id, status: 1)
CustomerSubscription.create!(customer_id: customer_3.id, subscription_id: subscription_6.id, status: 1)
