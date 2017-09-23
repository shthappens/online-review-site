require "rails_helper"

# As an authenticated user
# I want to update an item's information
# So that I can correct errors or provide new information

feature "Authenticated user updates an item" do

  scenario "user is prompted to login" do
    user = FactoryGirl.create(:user)
    beer = FactoryGirl.create(:craft_beer, name: "HSA", brewery: "Geary's", user_id: user.id)

    visit "/"
    click_on "Add Review"
    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end

  scenario "successfully updates item details" do
    user = FactoryGirl.create(:user)
    beer = FactoryGirl.create(:craft_beer, name: "Heddy Topper", brewery: "Vermont Brewery", user_id: user.id)

    visit "/"
    click_on "Sign in"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Log in"
    click_on "Details"
    click_on("Update this Craft Beer")
    fill_in "Brewery", with: "The Alchemist"
    click_on("Update Craft beer")
    expect(page).to have_content("Craft Beer was successfully updated.")
    expect(page).to have_content("Brewery: The Alchemist")
  end

  # As an authenticated user
  # I want to delete an item
  # So that no one can review it

  scenario "user deletes an item" do
    user = FactoryGirl.create(:user)
    beer = FactoryGirl.create(:craft_beer, name: "Flume", brewery: "Mast Landing", user_id: user.id)

    visit "/"
    click_on "Sign in"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Log in"
    click_on "Details"
    click_button "Delete this Craft Beer"
    expect(page).to have_content("Craft Beer successfully deleted.")
  end
end
