require 'spec_helper'
feature "As the original beer poster, I want to be able to delete my beer, because I no longer enjoy its taste" do

  # Acceptance Criteria
  # [ ] I must be signed in
  # [ ] I must be the creator of this beer post
  # [ ] I must be on the details page for a specific beer
  # [ ] I must be able to delete my beer by clicking the delete button
  # [ ] After deleting my beer, I will be redirected to the beer index page

  scenario 'successfully deleted a beer' do

    user = FactoryGirl.create(:user_with_beer)

    visit root_path
    click_link "Sign In"
    click_link user.beers.first
    click_link "Delete Beer"

    expect(page).to have_content("Beer Successfully Deleted")
  end

  scenario 'unsuccessfully delete a beer' do

    user = FactoryGirl.create(user_with_beer)
    beer = FactoryGirl.create(:beer)

    visit beer_show_path
    expect(page).to_not have_content("Delete Beer")
  end

end
