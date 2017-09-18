require "rails_helper"

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

      expect(page).to have_content "Welcome! You have signed up successfully."

    end

    scenario 'user fails to create an account' do
      visit '/'
      click_on 'Sign up'
      click_on 'Sign up'

      expect(page).to have_content('2 errors prohibited this user from being saved:')
      expect(page).to have_content('Sign up')
    end
  end
end
