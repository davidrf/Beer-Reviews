require 'rails_helper'

feature 'user views index', %{
  As a user,
  I want to visit the index page to view a list of beers
  So that I can learn about and review } do

  scenario 'goes to route root' do
    beer = FactoryGirl.create(:beer)

    visit root_path

    expect(page).to have_content(beer.name)
    # expect(page).to have_content(beer.rating)
  end
end
