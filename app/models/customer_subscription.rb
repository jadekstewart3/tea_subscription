class CustomerSubscription < ApplicationRecord
  belongs_to :customer
  belongs_to :subscription

  enum status: [:active, :inactive]

  validates_presence_of :customer_id,
                        :subscription_id,
                        :status

  delegate :title, :price, :frequency, to: :subscription
end
