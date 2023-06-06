require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe "relationships" do 
    it { should have_many(:subscriptions).through(:customer_subscriptions) }
  end
end
