require "rails_helper"

# As an authenticated user
# I want to update my information
# So that I can keep my profile up to date

feature "Authenticated user updates information" do

  scenario "Successfully updates email address" do
    visit "/"
    click_on "Sign up"
    fill_in "Email", with: "me@myemail.com"
    fill_in "Password", with: "secretpassword"
    fill_in "Password confirmation", with: "secretpassword"
    click_on "Sign up"
    click_on "Edit account"

    expect(page).to have_content("Edit User")

    fill_in "Email", with: "me2@mymail.com"
    fill_in "Current password", with: "secretpassword"
    click_on "Update"

    expect(page).to have_content("Your account has been updated successfully.")
  end

  scenario "Successfully updates password" do
    visit "/"
    click_on "Sign up"
    fill_in "Email", with: "me@thisemail.com"
    fill_in "Password", with: "secretpassword"
    fill_in "Password confirmation", with: "secretpassword"
    click_on "Sign up"
    click_on "Edit account"
    expect(page).to have_content("Edit User")

    fill_in "Email", with: "me@thisemail.com"
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"
    fill_in "Current password", with: "secretpassword"
    click_on "Update"

    expect(page).to have_content("Your account has been updated successfully.")
  end
end
