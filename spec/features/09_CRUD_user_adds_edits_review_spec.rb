require "rails_helper"

# A user adding a review
# A user viewing a list of reviews for an item
# A user updating a review
# A user deleting a review

feature "User adds review for an existing item" do
  scenario "user views list of items and adds a review" do
    user = FactoryGirl.create(:user)
    beer = FactoryGirl.create(:craft_beer, name: "HSA", brewery: "Geary's", user_id: user.id)
    # review = FactoryGirl.create(:craft_beer_review, user_id: user.id, craft_beer_id: beer.id)


    visit "/"
    expect(page).to have_content "HSA"
    expect(page).to have_content "Details | Add Review"

    click_on "Add Review"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Log in"
    fill_in "Description", with: "A malty English Ale"
    select "4", :from => "Rating"
    click_button "Create Craft beer review"

    expect(page).to have_content "Review saved!"
  end

  scenario "user successfully edits a review" do
    user = FactoryGirl.create(:user)
    beer = FactoryGirl.create(:craft_beer, name: "HSA", brewery: "Geary's", user_id: user.id)
    review = FactoryGirl.create(:craft_beer_review, user_id: user.id, craft_beer_id: beer.id)

    visit "/"
    click_on "Sign in"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Log in"
    click_on "Details"
    click_on "Update this Craft Beer Review"

    expect(page).to have_content "Editing a Craft Beer Review"
    fill_in "Description", with: "A malty English Ale which is great in the winter!"
    click_button "Update Craft beer review"

    expect(page).to have_content "Craft Beer review was successfully updated."
  end
end
