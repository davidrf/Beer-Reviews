require 'spec_helper'

feature 'Admin edits information for each individual beer page', %Q{
    As an admin, I want to be able to edit
    the information for all beers cause I’m in charge
  } do

#Acceptance Criteria
#I must be signed in
#I must be able to get here through the details page for a specific beer
#I must fill in the required fields
#I must be presented with errors if I fill out the form incorrectly


  scenario 'successfully edit information' do
    admin = FactoryGirl.create(:admin_with_beer)

    visit beer_path(@beer)
    click_link 'Sign In'
    click_link 'Edit Beer'
    fill_in 'Name', with: 'Budweiser'
    select 
    click_button 'Update Beer'

    expect(page).to have_content("Your beer has been updated!")
  end

  scenario 'unsuccessfully edit information' do
    admin = FactoryGirl.create(:admin_with_beer)

    visit beer_path(@beer)
    fill_in 'Name', with: ''
    fill_in 'Style', with: ''
    click_button 'Update Beer'

    expact(page).to_not have_content("Your beer has been updated!")
end
