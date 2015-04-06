require "rails_helper"
feature "As a user, I want to search for a beer", %{
  [ ] I should be able to search for a beer
  [ ] I must recieve an error message if beer doesn't exist
  [ ] I should see an index of beers that match my search
} do
  scenario "successfully search for a brew" do
    beer = FactoryGirl.create(:beer)
    beer2 = FactoryGirl.create(:beer, name: "PBR")

    visit root_path
    fill_in "search-bar", with: beer.name
    click_button "Search"
    expect(page).to have_content(beer.name)
    expect(page).to_not have_content(beer2.name)
  end

  scenario "unsuccessfully searches for a brew" do
    visit root_path
    fill_in "search-bar", with: "words"
    click_button "Search"

    expect(page).to have_content("No Matching Beer")
    expect(page).to_not have_content("words")
  end
end
