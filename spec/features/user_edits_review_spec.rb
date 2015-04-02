require "rails_helper"

feature "User edits review", %{
  As a user, I want to be able to edit my review so that it sounds better
  } do

  # I must be signed in
  # I must be the creator of this review
  # I must be able to get here by clicking the edit button next to the
  # review on the details page for a specific beer
  # I will be redirected to a separate page where I can edit the form

  scenario "successfully edit review" do
    beer = FactoryGirl.create(:beer)
    review = FactoryGirl.create(:review, beer: beer)
    user = review.user

    visit root_path
    sign_in_as(user)
    click_link beer.name
    click_link "Edit Review"
    fill_in "Description", with: "I really like this beer"
    select "8", from: "Rating"
    click_button "Update Review"

    expect(page).to have_content("Your review has been updated!")
  end

  scenario "edit review with invalid information" do
    beer = FactoryGirl.create(:beer)
    review = FactoryGirl.create(:review, beer: beer)
    user = review.user

    visit root_path
    sign_in_as(user)
    click_link beer.name
    click_link "Edit Review"
    fill_in "Description", with: ""
    click_button "Update Review"

    expect(page).to have_content("Description can't be blank")
  end

  scenario "cannot review without signing in" do
    beer = FactoryGirl.create(:beer)
    review = FactoryGirl.create(:review, beer: beer)

    visit root_path
    click_link beer.name

    expect(page).to have_content(review.description)
    expect(page).to_not have_link("Edit Review")
  end
end
