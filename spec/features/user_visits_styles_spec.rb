require "rails_helper"
feature "As a user, I want to view beers by style", %{
  [ ] I must be able to view beers by style
} do
  scenario "search a style with an existing beer" do
    beer = FactoryGirl.create(:beer)

    visit root_path
    click_link "Styles"
    click_link beer.style.name

    expect(page).to have_content(beer.name)
  end

  scenario "search a style without an existing beer" do
    style = FactoryGirl.create(:style)

    visit root_path
    click_link "Styles"
    click_link style.name

    expect(page).to have_content("No beers found")
  end
end
