require 'rails_helper'

# As an authenticated user
# I want to add an item
# So that others can review it

feature "Authenticated user adds an item to the database" do
  user = FactoryGirl.create(:user)
  beer = FactoryGirl.create(:craft_beer)

  scenario "User signs up and adds an item" do
    visit "/"
    click_on "Sign up"
    fill_in "Email", with: "myemail@me.com"
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"
    click_button "Sign up"
    visit new_craft_beer_path
    fill_in "Name", with: beer.name
    fill_in "Brewery", with: beer.brewery
    select "Double IPA", :from => "craft_beer[craft_beer_type]"
    click_button "Create Craft beer"

    expect(page).to have_content "Craft Beer was successfully created."
  end
end
