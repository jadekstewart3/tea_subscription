class Subscription < ApplicationRecord
  attr_accessor :status

  has_many :subscription_teas
  has_many :customer_subscriptions
  has_many :customers, through: :customer_subscriptions
  has_many :teas, through: :subscription_teas

  validates_presence_of :title

  validates_numericality_of :price,
                            :frequency,
                            greater_than: 0
end
