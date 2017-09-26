require "rails_helper"

# As an authenticated user
# I want to view a list of items
# So that I can pick items to review

feature "Authenticated user views item detail" do

  scenario "User authenticates and views list of items" do
    user_1 = FactoryGirl.create(:user)
    user_2 = FactoryGirl.create(:user)
    beer_1 = FactoryGirl.create(:craft_beer, name: "Geary's Summer Ale", brewery: "Geary's")
    beer_2 = FactoryGirl.create(:craft_beer, name: "Tesselation", brewery: "Lone Pine")

    visit "/"
    click_on "Sign in"
    fill_in "Email", with: user_1.email
    fill_in "Password", with: user_1.password
    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Geary's Summer Ale")
    expect(page).to have_content("Tesselation")
    expect(page).to have_content("Geary's")
    expect(page).to have_content("Lone Pine")
    expect(page).to have_content("Details | Add Review")
  end
end

# As an authenticated user
# I want to view the details about an item
# So that I can get more information about it

feature "Authenticated user views item details" do
  scenario "successfully views item detials" do
    user_3 = FactoryGirl.create(:user)
    beer_3 = FactoryGirl.create(
    :craft_beer, name: "Geary's Summer Ale", brewery: "Geary's",
    craft_beer_type: "Ale", user_id: user_3.id)

    visit "/"
    click_on "Sign in"
    fill_in "Email", with: user_3.email
    fill_in "Password", with: user_3.password
    click_button "Log in"

    visit "/"
    click_on "Details"
    expect(page).to have_content("Geary's Summer Ale")
    expect(page).to have_content("Ale")
    expect(page).to have_content("Review this Craft Beer")
  end
end
