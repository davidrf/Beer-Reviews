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
    beer = FactoryGirl.create(:beer_with_reviews)
    another_beer = FactoryGirl.create(:beer_with_reviews)

    visit root_path
    click_link beer.name

    expect(page).to have_selector('ul li:first-child',
      text: beer.reviews.first.description)
    expect(page).to have_selector('ul li:last-child',
      text: beer.reviews.last.description)
    expect(page).to_not have_content(another_beer.reviews.first.description)
    expect(page).to_not have_content(another_beer.reviews.last.description)
  end
end
