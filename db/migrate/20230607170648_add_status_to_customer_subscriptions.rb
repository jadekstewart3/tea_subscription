class AddStatusToCustomerSubscriptions < ActiveRecord::Migration[7.0]
  def change
    add_column :customer_subscriptions, :status, :integer
  end
end
