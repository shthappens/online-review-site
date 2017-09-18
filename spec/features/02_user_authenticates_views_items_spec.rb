require "rails_helper"

# As an unauthenticated user
# I want to sign in
# So that I can post items and review them


feature "Authenticated user signs in to views items" do

  scenario "User signs in" do
    user = FactoryGirl.create(:user)
    beer = FactoryGirl.create(:craft_beer)

    visit "/"
    click_on "Sign in"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Sign out")
    expect(page).to have_content("Flume")
    expect(page).to have_content("Mast Landing")
    expect(page).to have_content("Double IPA")
  end
end
