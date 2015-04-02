require "rails_helper"
feature "As an admin, I want to be able to delete all reviews", %{
  [ ]I must be signed in
  [ ]I must be on the details page for a specific beer
  [ ]I must be able to delete a review by clicking the delete button
  [ ]After deleting a review, the page will re-render
} do
  scenario "successfully deleted all reviews" do
    admin = FactoryGirl.create(:user, role: "admin")
    review = FactoryGirl.create(:review)

    visit root_path
    sign_in_as(admin)
    click_link review.beer.name
    click_link "Delete Review"

    expect(page).to have_content("Your review has been deleted!")
  end

  scenario "unsuccessfully delete all reviews" do
    user = FactoryGirl.create(:user, role: "admin")
    review = FactoryGirl.create(:review)

    visit root_path
    click_link review.beer.name

    expect(page).to_not have_link("Delete Reviews")
  end
end
