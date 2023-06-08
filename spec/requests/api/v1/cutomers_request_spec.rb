require "rails_helper"

describe "Customers API" do 
  describe "Customers Show" do 
    it "can get a customer show page" do 
      customer = create(:customer)
      
      subscription_1 = create(:subscription)
      subscription_2 = create(:subscription)
      subscription_3 = create(:subscription)

      create(:customer_subscription, customer: customer, subscription: subscription_1, status: 1)
      create(:customer_subscription, customer: customer, subscription: subscription_2)
      create(:customer_subscription, customer: customer, subscription: subscription_3)
      get "/api/v1/customers/#{customer.id}"

      customer_response = JSON.parse(response.body, symbolize_names: true)
     
      expect(response).to  be_successful
      expect(customer_response).to have_key(:data)
      expect(customer_response[:data]).to be_a(Hash)

      expect(customer_response[:data]).to have_key(:id)
      expect(customer_response[:data][:id]).to be_a(String)

      expect(customer_response[:data]).to have_key(:id)
      expect(customer_response[:data][:type]).to be_a(String)

      expect(customer_response[:data]).to have_key(:attributes)
      expect(customer_response[:data][:attributes]).to be_a(Hash)

      expect(customer_response[:data][:attributes]).to have_key(:first_name)
      expect(customer_response[:data][:attributes][:first_name]).to be_a(String)

      expect(customer_response[:data][:attributes]).to have_key(:last_name)
      expect(customer_response[:data][:attributes][:last_name]).to be_a(String)

      expect(customer_response[:data][:attributes]).to have_key(:email)
      expect(customer_response[:data][:attributes][:email]).to be_a(String)

      expect(customer_response[:data][:attributes]).to have_key(:address)
      expect(customer_response[:data][:attributes][:address]).to be_a(String)

      expect(customer_response[:data][:attributes]).to have_key(:customer_subscriptions)
      expect(customer_response[:data][:attributes][:customer_subscriptions]).to be_a(Hash)

      expect(customer_response[:data][:attributes][:customer_subscriptions]).to have_key(:data)
      expect(customer_response[:data][:attributes][:customer_subscriptions][:data]).to be_an(Array)

      subscription_info = customer_response[:data][:attributes][:customer_subscriptions][:data]

      subscription_info.each do |sub|
        expect(sub).to have_key(:id)
        expect(sub[:id]).to be_a(String)

        expect(sub).to have_key(:type)
        expect(sub[:type]).to be_a(String)

        expect(sub).to have_key(:attributes)
        expect(sub[:attributes]).to be_a(Hash)

        expect(sub[:attributes]).to have_key(:id)
        expect(sub[:attributes][:id]).to be_an(Integer)

        expect(sub[:attributes]).to have_key(:customer_id)
        expect(sub[:attributes][:customer_id]).to be_an(Integer)

        expect(sub[:attributes]).to have_key(:title)
        expect(sub[:attributes][:title]).to be_a(String)

        expect(sub[:attributes]).to have_key(:status)
        expect(sub[:attributes][:status]).to be_a(String)

        expect(sub[:attributes]).to have_key(:price)
        expect(sub[:attributes][:price]).to be_a(Float)

        expect(sub[:attributes]).to have_key(:frequency)
        expect(sub[:attributes][:frequency]).to be_an(Integer)
      end
    end
  end
end