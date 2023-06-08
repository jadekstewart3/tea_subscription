require 'rails_helper'

RSpec.describe SubscriptionTea, type: :model do
  describe "relationships" do
    it { should belong_to :tea }
    it { should belong_to :subscription }
  end

  describe "validations" do 
    it { should validate_presence_of :tea_id }
    it { should validate_presence_of :subscription_id }
  end
end
