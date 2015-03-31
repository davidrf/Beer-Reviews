require 'rails_helper'

feature 'see reviews', %Q{
  As a user,
  I want to view the reviews for a beer
  So that my mind can be influenced
} do
  # Acceptance Criteria
  # * I must be on the details page for a specific beer
  # * I must only see the reviews for the beer I’m viewing
  # * I must see the reviews listed in order, most recent first

  scenario 'sucessfully see reviews' do
    beer_1 = FactoryGirl.create(:beer)
    review_1 = Factorygirl.create(:review, beer: beer_1)
    review_2 = Factorygirl.create(:review, beer: beer_1)
    review_3 = Factorygirl.create(:review)

    visit root_path
    click_link beer_1.name

    expect(page).to have_selector('ul li:first-child',
      text: review_2.description)
    expect(page).to have_selector('ul li:last-child',
      text: review_1.description)
    expect(page).to_not have_content(review_3.description)
  end
end
