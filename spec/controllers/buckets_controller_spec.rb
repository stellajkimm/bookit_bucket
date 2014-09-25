require 'rails_helper'

describe BucketsController, :type => :controller do
	let!(:user) { create :user_with_buckets }
	let!(:bucket) { user.created_buckets.first }
	let!(:buckets) { user.created_buckets }
	context "#index" do
		it "is successful" do
			get :index
			expect(response).to be_success
		end
		it "assigns @buckets to Bucket.all" do
      get :index
      expect(assigns(:buckets)).to eq Bucket.all
    end
	# end
	# context "#home" do
	# 	it "is successful" do
	# 		get :home, :id => user.id
	# 		expect(response).to be_success
	# 	end
	# 	it "assigns @buckets to current user's owned buckets" do
 #      get :home, :id => user.id
 #      expect(assigns(:buckets)).to eq buckets
 #    end
	# end
	context "#show" do
		it "is successful" do
			get :show, :id => bucket.id
			expect(response).to be_success
		end
		it "assigns @bucket to bucket" do
      get :show, :id => bucket.id
      expect(assigns(:bucket)).to eq bucket
    end
	end

end