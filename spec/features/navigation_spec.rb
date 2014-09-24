require 'spec_helper'
describe "Navigation Bar", :js => true do
  let!(:user) { create :user }
  describe "User can use the navigation bar when not signed in" do
    it "redirects to the login when clicking on 'Sign In'" do
      visit root_path
      click_link("Sign In")
      expect(page).to have_selector('#new_user')
    end
    it "redirects to the signup when clicking on 'Sign Up'" do
      visit root_path
      click_link("Sign Up")
      expect(page).to have_selector('#new_user')
    end
    it "redirects to the root_path when clicking on 'Bookit Bucket'" do
      visit new_user_session_path
      click_link("Bookit Bucket")
      expect(page).to have_content('welcome to bookit bucket')
    end
  end

  describe "User can use the navigation bar when signed in" do
    before(:each) do
      visit root_path
      visit new_user_session_path
      fill_in('Email', :with => user.email )
      fill_in('Password', :with => user.password )
      click_button('Log in')
    end
    it "redirects to the root_path when clicking on 'Sign Out'" do
      visit buckets_home_path
      click_link("Sign Out")
      expect(page).to have_xpath('/')
    end
    it "redirects to your buckets page when clicking on 'Your Buckets'" do
      visit root_path
      click_link("Your Buckets")
      expect(page).to have_xpath('/buckets/home')
    end
  end
end