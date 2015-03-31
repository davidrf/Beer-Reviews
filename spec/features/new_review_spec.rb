require 'rails_helper'

feature 'see reviews', %Q{
  As a user,
  I want to post a review for a beer
  so that I can influence the minds of others
} do
  # Acceptance Criteria
  # * I must be signed in
  # * I must provide a rating and description
  # * I must be presented with errors if I fill out the form incorrectly

  scenario 'sucessfully see reviews' do
    review = FactoryGirl.create(:review)
    beer = FactoryGirl.create(:beer)

    visit root_path
    click_link beer.name
    click_link review.beer.name

    select '10', from: 'Rating'
    fill_in 'Description', with: 'Great beer'
    click_button 

    expect(page).to have_selector('ul li:first-child',
      text: beer.reviews.first.description)
    expect(page).to have_selector('ul li:last-child',
      text: beer.reviews.last.description)
    expect(page).to_not have_content(another_beer.reviews.first.description)
    expect(page).to_not have_content(another_beer.reviews.last.description)
  end
end
