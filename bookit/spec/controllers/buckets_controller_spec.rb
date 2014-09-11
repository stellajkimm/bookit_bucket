require 'rails_helper'

RSpec.describe BucketsController, :type => :controller do
	let!(:bucket) { FactoryGirl.create :bucket }
	context "#index" do
		it "is successful" do
			get :index
			expect(response).to be_success
		end
		it "assigns @buckets to Bucket.all" do
      get :index
      expect(assigns(:buckets)).to eq Bucket.all
    end
	end
end