require "rails_helper"

feature "User deletes review", %{
  As a user, I want to be able to delete my
  review so that others don’t have to see how dumb I am
  } do

    # I must be signed in
    # I must be the creator of this review
    # I must be on the details page for a specific beer
    # I must be able to delete the review by clicking the delete button
    # After deleting the review, the page will re-render

  scenario "successfully delete review" do
    review = FactoryGirl.create(:review)
    beer = FactoryGirl.create(:beer)
    user = review.user

    visit root_path
    click_link "Sign In"
    click_link beer.name
    click_button "Delete Review"

    expect(page).to have_content("Your review has been deleted!")
  end

  scenario "delete review without signing in" do
    review = FactoryGirl.create(:review)
    beer = FactoryGirl.create(:beer)
    user = review.user

    visit root_path
    click_link beer.name

    expect(page).to_not have_content(delete.review)
  end
end
