require 'rails_helper'

RSpec.describe HashtagsController, :type => :controller do
	let!(:hashtag) { create :hashtag}
	context "#show" do
		it "is successful" do
			get :show, :id => hashtag.id
			expect(response).to be_success
		end
		it "assigns @hashtag to hashtag" do
      get :show, :id => hashtag.id
      expect(assigns(:hashtag)).to eq hashtag
    end
	end
end
