require 'rails_helper'

feature 'new reviews', %Q{
  As a user,
  I want to post a review for a beer
  so that I can influence the minds of others
} do
  # Acceptance Criteria
  # * I must be signed in
  # * I must provide a rating and description
  # * I must be presented with errors if I fill out the form incorrectly

  scenario 'successfully post review' do
    user = FactoryGirl.create(:user)
    beer = FactoryGirl.create(:beer)

    visit root_path
    click_link 'Sign In'
    click_link beer.name

    select '10', from: 'Rating'

    select 'Rating', from: '10'
    fill_in 'Description', with: 'Great Beer'
    click_button 'Submit Review'

    expect(page).to have_content('Review Posted!')
    expect(page).to have_content('10')
    expect(page).to have_content('Great Beer')
  end

  scenario 'required fields not filled in' do
    user = FactoryGirl.create(:user)
    beer = FactoryGirl.create(:beer)

    visit root_path
    click_link 'Sign In'
    click_link beer.name

    select '10', from: 'Rating'
    fill_in 'Description', with: 'Great Beer'

    expect(page).to have_content('Description cannot be blank')
  end

  scenario 'not signed in' do
    user = FactoryGirl.create(:user)
    beer = FactoryGirl.create(:beer)

    visit root_path
    click_link beer.name

    select '10', from: 'Rating'
    fill_in 'Description', with: 'Great Beer'

    expect(page).to_not have_content('Please sign in to review')
  end
end
