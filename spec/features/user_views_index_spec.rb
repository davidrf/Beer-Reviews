require 'rails_helper'

feature 'user views index', %Q{
  As a user,
  I want to visit the index page to view a list of beers
  So that I can learn about and review } do
<<<<<<< HEAD

=======
  scenario 'goes to route root' do
>>>>>>> 3c79ba469ef7a37331254539dbe958ff0d4cb774
    beer = FactoryGirl.create(:beer)

    visit root_path

    expect(page).to have_content(beer.name)
    expect(page).to have_content(beer.rating)
  end
end
