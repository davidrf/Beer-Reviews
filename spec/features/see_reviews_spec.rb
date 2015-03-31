require "rails_helper"

feature "see reviews", %Q{
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

    expect(page).to have_selector("ul li:first-child",
      text: reviews.last.description)
    expect(page).to have_selector("ul li:last-child",
      text: reviews.first.description)
    expect(page).to_not have_content(unrelated_review)
  end
end
