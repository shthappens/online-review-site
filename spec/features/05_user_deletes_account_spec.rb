require "rails_helper"

# As an authenticated user
# I want to delete my account
# So that my information is no longer retained by the app

feature "User successfully deletes an account" do
  scenario "User deletes an account" do
    visit "/"
    click_on "Sign up"
    fill_in "Email", with: "me@myemail.com"
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"
    click_button "Sign up"

    expect(page).to have_content "Welcome! You have signed up successfully."

    click_on "Edit account"
    expect(page).to have_content "Cancel my account"
    click_button "Cancel my account"

    expect(page).to have_content "Bye! Your account has been successfully cancelled. We hope to see you again soon."
  end
end
