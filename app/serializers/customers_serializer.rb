class CustomersSerializer
  include JSONAPI::Serializer
  attributes :first_name, :last_name, :email, :address

  attribute :customer_subscriptions do |customer|
    CustomerSubscriptionsSerializer.new(customer.customer_subscriptions)
  end
end
