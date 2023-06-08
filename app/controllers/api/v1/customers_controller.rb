class Api::V1::CustomersController < ApplicationController

  def show
    customer = Customer.find(params[:id])  
  
    render json: CustomersSerializer.new(customer), status: 200
  end
end