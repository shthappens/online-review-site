require "rails_helper"

# As an authenticated user
# I want to sign out
# So that no one else can post items or reviews on my behalf

feature "Authenticated user signs out" do

  scenario "Authenticated user successfully signs out" do
    visit "/"
    click_on "Sign up"
    fill_in "Email", with: "me@myemail.com"
    fill_in "Password", with: "supersecret"
    fill_in "Password confirmation", with: "supersecret"
    click_button "Sign up"
    expect(page).to have_content "Welcome! You have signed up successfully."
    click_on "Sign out"
    expect(page).to have_content "Signed out successfully."

  end
end
