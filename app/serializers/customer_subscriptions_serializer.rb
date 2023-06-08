class CustomerSubscriptionsSerializer
  include JSONAPI::Serializer
  attributes :id, 
             :customer_id, 
             :title,
             :status,
             :price,
             :frequency
end
