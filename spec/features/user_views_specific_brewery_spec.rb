require 'rails_helper'

feature 'user views specific brewery', %{
  As a user,
  I want to visit the details page of a specific brewery
  so that I can see which beers they brew } do

  scenario 'goes to specific brewery' do
    brewery = FactoryGirl.create(:brewery)
    visit root_path
    click_link "Breweries"
    click_link brewery.name

    expect(page).to have_content(brewery.name)
    expect(page).to have_content(brewery.city)
    expect(page).to have_content(brewery.country)
    expect(page).to have_content(brewery.description)
    expect(page).to have_content(brewery.year)
  end
end
