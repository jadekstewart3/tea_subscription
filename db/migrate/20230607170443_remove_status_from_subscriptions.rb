class RemoveStatusFromSubscriptions < ActiveRecord::Migration[7.0]
  def change
    remove_column :subscriptions, :status, :integer
  end
end
