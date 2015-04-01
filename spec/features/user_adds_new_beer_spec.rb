require 'rails_helper'

feature 'user posts new beer', %{
  As a user,
  I want to post information about a new beer
  So that I can share my beer love with the rest of the world
} do
  #   Acceptance Criteria
  #   - I must be signed in
  # 	- I must provide a name
  # 	- I must be presented with errors if I fill out the form incorrectly

  scenario 'user posts a new beer' do
    beer = FactoryGirl.build(:beer)
    user = FactoryGirl.create(:user)

    visit root_path
    sign_in_as(user)
    click_link 'Add Beer'

    fill_in 'Name', with: beer.name
    select "Lager", from: "Style"
    click_button 'Submit Beer'

    expect(page).to have_content(beer.name)
  end

  scenario 'missing required information' do
    user = FactoryGirl.create(:user)

    visit root_path
    sign_in_as(user)
    click_link 'Add Beer'
    click_button 'Submit Beer'

    expect(page).to have_content("Beer not added")
    expect(page).to have_content("Name can't be blank")
  end

  scenario 'user not signed in' do
    visit root_path

    expect(page).not_to have_button("Add Beer")
  end
end
