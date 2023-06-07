class Customer < ApplicationRecord
  has_many :customer_subscriptions
  has_many :subscriptions, through: :customer_subscriptions

  before_validation :downcase_email

  validates :email, uniqueness: true,
                    presence: true,
                    format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates_presence_of :first_name,
                        :last_name,
                        :address,
                        presence: true
                        

  private
  def downcase_email
    self.email = email.downcase if email.present?
  end
end
