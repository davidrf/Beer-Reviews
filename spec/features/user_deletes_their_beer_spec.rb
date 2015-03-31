require "spec_helper"
feature "As the original beer poster, I want to be able to delete my beer", %{

  [ ] I must be signed in
  [ ] I must be the creator of this beer post
  [ ] I must be on the details page for a specific beer
  [ ] I must be able to delete my beer by clicking the delete button
  [ ] After deleting my beer, I will be redirected to the beer index page
} do
  scenario "successfully deleted a beer" do
    beer = FactoryGirl.create(:beer)
    user = beer.user

    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_link beer.name
    click_link "Delete Beer"

    expect(page).to have_content("Beer Successfully Deleted")
  end

  scenario "unsuccessfully delete a beer" do
    user = FactoryGirl.create(:user)
    beer = FactoryGirl.create(:beer)

    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_link beer.name
    expect(page).to_not have_content("Delete Beer")
  end
end
