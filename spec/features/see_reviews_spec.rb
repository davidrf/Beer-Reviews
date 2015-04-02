require "rails_helper"

feature "see reviews", %{
  As a user,
  I want to view the reviews for a beer
  So that my mind can be influenced
} do
  # Acceptance Criteria
  # * I must be on the details page for a specific beer
  # * I must only see the reviews for the beer I’m viewing
  # * I must see the reviews listed in order, most recent first

  scenario "sucessfully see reviews" do
    review = FactoryGirl.create(:review)

    visit root_path
    click_link review.beer.name

    expect(page).to have_content(review.description)
  end

  scenario "see reviews in correct order" do
    beer = FactoryGirl.create(:beer)
    reviews = FactoryGirl.create_list(:review, 2, beer: beer)

    visit root_path
    click_link reviews.last.beer.name

    new_review_position = page.body.index(reviews.last.description)
    old_review_position = page.body.index(reviews.first.description)
    expect(new_review_position).to be < old_review_position
  end

  scenario "don't see unrelated reviews" do
    review = FactoryGirl.create(:review)
    unrelated_review = FactoryGirl.create(:review)

    visit root_path
    click_link review.beer.name

    expect(page).to have_content(review.description)
    expect(page).to_not have_content(unrelated_review.description)
  end
end
