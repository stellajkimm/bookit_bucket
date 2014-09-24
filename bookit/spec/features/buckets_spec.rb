srequire 'rails_helper'
describe "Bucket" do #, :js => true do
  let(:user) { create :user_with_buckets }
  let(:buckets) { user.created_buckets }

  describe "User can see all buckets" do
    it "by visting the homepage" do
      visit root_path
      p "***"
      p buckets
      p "***"
      ### strange. buckets show up but do not show up when testing.
      buckets.each do |t|
        expect(page).to have_content t.name
      end
    end
  end
end