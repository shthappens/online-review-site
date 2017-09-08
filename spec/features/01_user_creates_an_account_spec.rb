# As a prospective user
# I want to create an account
# So that I can post items and review them

require 'rails_helper'

feature "A new user creates an account" do

  context "user visits the create account page" do

    scenario "User successfully creates an account" do
      visit new_user_registration_path
      fill_in "Email", with: "me@me.com"
      fill_in "Password", with: "1234567"
      fill_in "Password confirmation", with: "1234567"
      click_button "Sign up"
      #
      # expect page_to have_content "Successfully..."

    end

    scenario "User posts items and reviews items" do

    end
  end
end
