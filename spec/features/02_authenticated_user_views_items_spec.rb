# As an authenticated user
# I want to view a list of items
# So that I can pick items to review

feature "Authenticated user signs in to views items" do

  scenario "User signs in" do
    user = FactoryGirl.create(:user)
    beer = FactoryGirl.create(:craft_beer)

    visit new_user_session_path
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
