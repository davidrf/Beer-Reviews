require 'rails_helper'

feature 'user edits beer', %Q{
  As a signed up user,
  I want to post a review for a beer
  So that I can influence the minds of others
} do
  # Acceptance Criteria
  # * I must be signed in
  # * I must provide a rating and description
  # * I must be presented with errors if I fill out the form incorrectly

  scenario 'beer information is change' do
    user = FactoryGirl.create(:user_with_beer)

    visit root_path
    click_link 'Sign In'
    click_link user.beers.first
    click_link 'Edit Beer'

    fill_in 'Name', with: 'Edited Beer'
    fill_in 'ABV', with: '50'
    fill_in 'IBU', with: '50'
    select 'Lager', from: 'Style'
    click_button 'Update Beer'

    expect(page).to have_content('Beer Information Updated')
  end
end
