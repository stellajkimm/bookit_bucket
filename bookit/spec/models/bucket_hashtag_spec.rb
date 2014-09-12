require 'rails_helper'

RSpec.describe BucketHashtag, :type => :model do
  context "associations" do
  	it { should belong_to(:bucket) }
  	it { should belong_to(:hashtag) }
  end
end
