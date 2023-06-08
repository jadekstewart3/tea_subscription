require "rails_helper"

RSpec.describe "Subscription Request" do 
  describe "When successful" do
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
  end

  describe "When unsuccessful" do
    it "will not create a customer subscription with an invalid subscription id" do
      customer = create(:customer)
      subscription = create(:subscription)
      customer_subscription_params =  { subscription_id: 278,
                                          status: 0
                                        }
      headers = { "CONTENT_TYPE" => "application/json" }

      post "/api/v1/customers/#{customer.id}/subscriptions", headers: headers, params: JSON.generate(customer_subscription_params)
      
      failed_subscription = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(failed_subscription).to have_key(:errors)
      expect(failed_subscription[:errors]).to eq("No matches found")
    end
  end

  describe "cancel a tea subscription" do
    describe "When successful" do
      it "changes the customer subscription to inactive" do
        customer = create(:customer)
        subscription = create(:subscription)
        customer_subscription = create(:customer_subscription, subscription: subscription, customer: customer, status: 0)

        customer_subscription_params =  { 
                                          status: 1
                                        }

        headers = { "CONTENT_TYPE" => "application/json" }
        
        patch "/api/v1/customers/#{customer.id}/subscriptions/#{subscription.id}", headers: headers, params: JSON.generate(customer_subscription_params)

        expect(response).to be_successful
        customer_subscription.reload
        expect(customer_subscription.status).to eq("inactive")
      end
    end

    describe "When unsuccessful" do
      it "will not cancel a subscription that does not exist" do
        customer = create(:customer)
        subscription = create(:subscription)
        customer_subscription = create(:customer_subscription, subscription: subscription, customer: customer, status: 0)

        customer_subscription_params =  { 
                                          subscription_id: "",
                                          status: 1
                                        }
        headers = { "CONTENT_TYPE" => "application/json" }
        
        patch "/api/v1/customers/#{customer.id}/subscriptions/#{subscription.id}", headers: headers, params: JSON.generate(customer_subscription_params)
        
        failed_update = JSON.parse(response.body, symbolize_names: true)

        expect(response).to_not be_successful
        expect(failed_update).to have_key(:message)
        expect(failed_update[:message]).to eq("your query could not be completed")

        expect(failed_update).to have_key(:errors)
        expect(failed_update[:errors]).to be_an(Array)
        expect(failed_update[:errors].first).to have_key(:status)
        expect(failed_update[:errors].first[:status]).to eq("400")
        expect(failed_update[:errors].first).to have_key(:title)
        expect(failed_update[:errors].first[:title]).to eq("Validation failed: Subscription must exist, Subscription can't be blank")
      end
    end
  end
end