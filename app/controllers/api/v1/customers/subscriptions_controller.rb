class Api::V1::Customers::SubscriptionsController < ApplicationController
  
  def create
    customer = Customer.find(params[:customer_id])
  
    customer_subscription = customer.customer_subscriptions.new(customer_subscription_params)
    if customer_subscription.save
      render json: CustomerSubscriptionsSerializer.new(customer_subscription), status: 201
    end
  end

  def update
    customer_subscription = CustomerSubscription.find_by(subscription_id: params[:id], customer_id: params[:customer_id])
    customer_subscription.update!(customer_subscription_params)
    render json: CustomerSubscriptionsSerializer.new(customer_subscription)
  end

  private
  def customer_subscription_params
    params.permit(:subscription_id, :status)
  end
end