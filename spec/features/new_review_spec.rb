require "rails_helper"

feature "new reviews", %Q{
  As a user,
  I want to post a review for a beer
  so that I can influence the minds of others
} do
  # Acceptance Criteria
  # * I must be signed in
  # * I must provide a rating and description
  # * I must be presented with errors if I fill out the form incorrectly

  scenario "successfully post review" do
    beer = FactoryGirl.create(:beer)
    user = beer.user

    visit root_path
    sign_in_as(user)
    click_link beer.name

    select "10", from: "Rating"
    fill_in "Description", with: "Great Beer"
    click_button "Submit Review"

    expect(page).to have_content("Review Posted!")
    expect(page).to have_content("10")
    expect(page).to have_content("Great Beer")
  end

  scenario "required fields not filled in" do
    beer = FactoryGirl.create(:beer)
    user = beer.user

    visit root_path
    sign_in_as(user)
    click_link beer.name

    select "10", from: "Rating"
    click_button "Submit Review"

    expect(page).to have_content("Description cannot be blank")
  end

  scenario "not signed in" do
    beer = FactoryGirl.create(:beer)

    visit root_path
    click_link beer.name

    expect(page).to_not have_button("Submit Review")
  end
end
