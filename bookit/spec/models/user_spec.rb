require 'rails_helper'

RSpec.describe User, :type => :model do
	let!(:user) { FactoryGirl.create(:user) }

  context "validations" do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
  end

  context "associations" do
    it { should have_many :bucketownerships }
		it { should have_many :owned_buckets }
    it { should have_many :created_buckets }
    it { should have_many :attendances }
  	it { should have_many :attending_items }

  end
end
