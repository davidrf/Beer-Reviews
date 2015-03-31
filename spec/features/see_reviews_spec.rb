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
    reviews = Factorygirl.create_list(:review, 2)
    unrelated_review = Factorygirl.create(:review)

    visit root_path
    click_link reviews.first.beer

    page.body.index(reviews.last.description) < page.body.index(reviews.first.description)
    expect(page).to_not have_content(unrelated_review.description)
  end
end
