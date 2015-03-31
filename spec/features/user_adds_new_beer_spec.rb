require 'rails_helper'

feature 'user posts new beer', %Q{
  As a user,
  I want to post information about a new beer
  So that I can share my beer love with the rest of the world
} do
  scenario 'user posts a new beer' do
    beer = FactoryGirl.build(:beer)
    user = FactoryGirl.create(:user)

    visit root_path
    click_button "Sign In"

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    click_button 'Add Beer'

    fill_in 'Name', with: beer.name
    fill_in 'Style', with: beer.style_id
    click_button 'New Beer'

    expect(page).to have_content(beer.name)
  end

  scenario 'unsuccessful post' do
    user = FactoryGirl.create(:user)

    visit root_path
    click_button "Sign In"

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    click_button 'Add Beer'

    click_button 'New Beer'

    expect(page).to have_content("Beer not added")
    expect(page).to have_content("Beer must have name")
    expect(page).to have_content("Beer must have a style")
  end

  scenario 'user not signed in' do

    visit root_path

    expect(page).not_to have_button("Add Beer")
  end
end
