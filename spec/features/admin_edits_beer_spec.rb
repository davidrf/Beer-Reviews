require 'spec_helper'

feature "Admin edits information for each individual beer page" do

  scenario 'successfully edit information' do
    admin = FactoryGirl.create(:admin_with_beer)

    visit beer_path(@beer)
    click_link 'Sign In'
    click_link 'Edit Beer'
    fill_in 'Name', with: 'Budweiser'
    fill_in 'Style', with: 'Lager'
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
