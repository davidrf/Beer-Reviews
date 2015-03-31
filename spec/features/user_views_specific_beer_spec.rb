require 'rails_helper'

feature 'user views specific beer', %{
  As a user,
  I want to visit the details page of a specific beer
  So that I can learn more about it } do
  scenario 'goes to specific beer' do
    beer = FactoryGirl.create(:beer)
    visit root_path
    click_on beer.name

    expect(page).to have_content(beer.name)
    expect(page).to have_content(beer.rating)
  end
end
