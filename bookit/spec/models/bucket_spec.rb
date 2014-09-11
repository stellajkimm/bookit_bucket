require 'rails_helper'

RSpec.describe Bucket, :type => :model do
	let!(:bucket) { FactoryGirl.create(:bucket) }

  context "associations" do
    it { should belong_to(:category) }
		it { should belong_to(:creator).class_name("User").with_foreign_key(:user_id) }
    it { should have_many(:bucketownerships) }
    it { should have_many(:owners).through(:bucketownerships).source(:user) }
  	it { should have_many(:items) }
  end
end
