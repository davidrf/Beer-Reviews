require 'rails_helper'

feature 'user views index of breweries', %{
  As a user,
  I want to visit the brewery index page to view a list of breweries
  so that I can select one and learn about it } do

  scenario 'goes to brewery index' do
    brewery = FactoryGirl.create(:brewery)

    visit root_path
    click_link "Breweries"
    save_and_open_page

    expect(page).to have_content(brewery.name)
  end
end
