require "rails_helper"
feature "As an admin, I want to be able to delete any beer", %{
  [ ] I must be signed in
  [ ] I must be on the details page for a specific beer
  [ ] I must be able to delete my beer by clicking the delete button
  [ ] After deleting each beer, I will be redirected to the beer index page
} do
  scenario "successfully deleted a beer" do
    admin = FactoryGirl.create(:user, role: 'admin')
    beer = FactoryGirl.create(:beer)
    visit root_path
    sign_in_as(admin)
    click_link beer.name
    click_link "Delete Beer"

    expect(page).to have_content("Beer Successfully Deleted")
  end
end
