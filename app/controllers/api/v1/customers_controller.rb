class Api::V1::CustomersController < ApplicationController

  def show
    begin
      customer = Customer.find(params[:id])  
      render json: CustomersSerializer.new(customer), status: 201
    rescue ActiveRecord::RecordNotFound => error
      render json: ErrorSerializer.new(error).error, status: 401
    end
  end
end