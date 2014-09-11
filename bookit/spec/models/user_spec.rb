require 'rails_helper'

RSpec.describe User, :type => :model do
	let!(:user) { FactoryGirl.create(:user) }

  context "validations" do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    # validate format of email
  end

  context "associations" do
    it { should have_many(:bucketownerships) }
		it { should have_many(:owned_buckets).through(:bucketownerships).source(:bucket) }
    it { should have_many(:created_buckets).class_name("Bucket").with_foreign_key(:user_id) }
    it { should have_many(:attendances) }
  	it { should have_many(:attending_items).through(:attendances).source(:item) }
  end
end
