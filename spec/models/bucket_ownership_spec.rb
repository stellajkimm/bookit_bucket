require 'rails_helper'

RSpec.describe BucketOwnership, :type => :model do
  context "associations" do
  	it { should belong_to :bucket }
  	it { should belong_to :user }
  end
end
