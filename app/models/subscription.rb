class Subscription < ApplicationRecord
  has_many :subscription_teas
  has_many :teas, through: :subscription_teas
  enum status: [:active, :inactive]

  validates_presence_of :title,
                        :status
                        
  validates_numericality_of :price,
                            :frequency,
                            greater_than: 0

end
