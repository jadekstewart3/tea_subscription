class SubscriptionTea < ApplicationRecord
  belongs_to :tea
  belongs_to :subscription

  validates_presence_of :tea_id,
                        :subscription_id
end
