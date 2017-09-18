require 'rails_helper'

# Create
# (add a record to the databse)
# (A user adds an item to the database)

feature "Authenticated user adds an item to the database" do
  user = FactoryGirl.create(:user)
  beer = FactoryGirl.create(:craft_beer)

  scenario "User signs in" do
    visit "/"
    click_on "Sign in"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.email
    click_button "Log in"
  end

  scenario "Authenticated user adds an item" do
    visit new_craft_beer_path
    fill_in "Name", with: beer.name
    fill_in "Brewery", with: beer.brewery
    fill_in "craft_beer_type", with: beer.craft_beer_type
    click_on "Create Craft Beer"

    expect(page).to have_content "Craft Beer was successfully created."
  end
end
