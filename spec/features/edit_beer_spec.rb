require "rails_helper"

feature "edit beer information", %{
  As the original beer poster,
  I want to be able to edit the information for the beer that I’ve added
  so that people think I’m competent
} do
  # Acceptance Criteria
  # * I must be signed in
  # * I must be able to get here through the details page for a specific beer
  # * I must fill in the required fields
  # * I must be presented with errors if I fill out the form incorrectly

  scenario "sucessfully edited" do
    beer = FactoryGirl.create(:beer)
    user = beer.user

    visit root_path
    sign_in_as(user)
    click_link beer.name
    click_link "Edit Beer"

    fill_in "Name", with: "Edited Beer"
    fill_in "ABV", with: "50"
    fill_in "IBU", with: "100"
    select beer.style.name, from: "Style"
    click_button "Submit Beer"

    expect(page).to have_content("Beer Information Updated")
    expect(page).to have_content("Edited Beer")
    expect(page).to have_content("50")
    expect(page).to have_content("100")
    expect(page).to have_content(beer.style.name)
  end

  scenario "required fields not filled in" do
    beer = FactoryGirl.create(:beer)
    user = beer.user

    visit root_path
    sign_in_as(user)
    click_link beer.name
    click_link "Edit Beer"
    fill_in "Name", with: ""
    click_button "Submit Beer"

    expect(page).to have_content("Invalid Beer Submission")
    expect(page).to have_content("Name can't be blank")
  end

  scenario "user not signed in" do
    beer = FactoryGirl.create(:beer)

    visit root_path
    click_link beer.name

    expect(page).to_not have_button("Edit Beer")
  end

  scenario "not owner of beer" do
    user = FactoryGirl.create(:user)
    beer = FactoryGirl.create(:beer)

    visit root_path
    sign_in_as(user)
    click_link beer.name

    expect(page).to_not have_button("Edit Beer")
  end
end
