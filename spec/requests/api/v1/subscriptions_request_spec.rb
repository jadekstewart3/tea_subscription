require "rails_helper"

RSpec.describe "Subscription Request" do 
  describe "create subscription" do
    it "subscribes a creating a customer subscription" do
      customer = create(:customer)
      subscription = create(:subscription)
      customer_subscription_params =  { subscription_id: subscription.id, 
                                        status: 0
                                      }

      headers = { "CONTENT_TYPE" => "application/json" }

      post "/api/v1/customers/#{customer.id}/subscriptions", headers: headers, params: JSON.generate(customer_subscription_params)

      customer_subscription = CustomerSubscription.last

      expect(response).to be_successful
      expect(customer.subscriptions.count).to eq(1)
    end
  end

  describe "cancel a tea subscription" do
    it "changes the customer subscription to inactive" do
      
    end
  end
end