require 'rails_helper'

RSpec.describe Bucket, :type => :model do
	let(:bucket) { FactoryGirl.create(:bucket) }

  context "associations" do
    it { should belong_to(:creator).class_name("User").with_foreign_key(:user_id) }
    it { should have_many(:hashtags) }
    it { should have_many(:bucketownerships) }
    it { should have_many(:owners).through(:bucketownerships).source(:user) }
  	it { should have_many(:items) }
  end

  context "make_ownership" do
  	# bucket = FactoryGirl.build(:bucket)
  	# Bucketownership.should_receive(:create).with(user_id: bucket.user_id)
  	# bucket.save
  end
end
