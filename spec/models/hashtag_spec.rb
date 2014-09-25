require 'rails_helper'

RSpec.describe Hashtag, :type => :model do
  context "associations" do
  	it { should have_many(:bucket_hashtags) }
  	it { should have_many(:buckets).through(:bucket_hashtags) }
  end
end
