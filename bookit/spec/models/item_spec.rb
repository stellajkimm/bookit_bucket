require 'rails_helper'

RSpec.describe Item, :type => :model do
  context "associations" do
  	it { should belong_to(:bucket) }
  	it { should have_many(:attendances) }
  	it { should have_many(:attending_users).through(:attendances).source(:user) }
  end
end
