require 'spec_helper'
describe "Navigation Bar" do
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
  end
end