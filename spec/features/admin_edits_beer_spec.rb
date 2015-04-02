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
    admin = FactoryGirl.create(:user, role: 'admin')
    beer = FactoryGirl.create(:beer)

    visit root_path
    sign_in_as(admin)
    click_link beer.name
    click_link "Edit Beer"
    fill_in "Name", with: "Budweiser"
    select "Lager", from: "Style"
    click_button "Submit Beer"

    expect(page).to have_content("Beer Information Updated")
  end

  scenario "unsuccessfully edits beer" do
    beer = FactoryGirl.create(:beer)
    admin = FactoryGirl.create(:user, role: 'admin')

    visit root_path
    sign_in_as(admin)
    click_link beer.name
    click_link "Edit Beer"
    fill_in "Name", with: ""
    click_button "Submit Beer"

    expect(page).to have_content("Invalid Beer Submission")
  end
end
