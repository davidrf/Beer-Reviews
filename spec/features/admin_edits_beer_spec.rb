require "rails_helper"

feature "Admin edits information for each individual beer page", %{
    As an admin, I want to be able to edit
    the information for all beers cause I’m in charge
  } do

# Acceptance Criteria
# I must be signed in
# I must be able to get here through the details page for a specific beer
# I must fill in the required fields
# I must be presented with errors if I fill out the form incorrectly

  scenario "successfully edits beer" do
    admin = FactoryGirl.create(:admin)
    beer = FactoryGirl.create(:beer)

    visit root_path
    click_link "Sign In"
    click_link beer.name
    click_button "Edit Beer"
    fill_in "Name", with: "Budweiser"
    select "Lager", from: "Style"
    click_button "Update Beer"

    expect(page).to have_content("Your beer has been updated!")
  end

  scenario "unsuccessfully edits beer" do
    admin = FactoryGirl.create(:admin)
    beer = FactoryGirl.create(:beer)

    visit root_path
    click_link "Sign In"
    click_link beer.name
    click_button "Edit Beer"
    click_button "Update Beer"

    expect(page).to have_content("Invalid Information!")
    expect(page).to_not have_content("Your beer has been updated!")
  end

  scenario "edits beer without signing in" do
    admin = FactoryGirl.create(:admin)
    beer = FactoryGirl.create(:beer)

    visit root_path
    click_link beer.name

    expect(page).to_not have_content(edit.beer)
  end
end
