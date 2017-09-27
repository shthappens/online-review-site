require "rails_helper"

# As an admin user
# I want to see a list of users and items
# So I can manage users and items

feature "Admin manages users" do
  scenario "Admin views users, items, and reviews" do
    admin_user = FactoryGirl.create(:user, role: "admin")
    user = FactoryGirl.create(:user)
    beer = FactoryGirl.create(:craft_beer, name: "HSA", brewery: "Geary's", user_id: user.id)
    review = FactoryGirl.create(:craft_beer_review, user_id: user.id, craft_beer_id: beer.id)

    visit "/"
    click_on "Sign in"
    fill_in "Email", with: admin_user.email
    fill_in "Password", with: admin_user.password
    click_on "Log in"
    click_on "Admin Tools"
    expect(page).to have_content "Delete User"
    expect(page).to have_content "HSA"
    expect(page).to have_content user.email

    click_button "Delete this Craft Beer Review"
    expect(page).to have_content "Craft Beer review was successfully deleted."
  end

  # scenario "deletes a user" do
  #   click_on "Admin Tools"
  #   click_on "Delete User"
  #   expect(page).to have_content "Bye! Your account has been successfully cancelled. We hope to see you again soon."
  # end
end
