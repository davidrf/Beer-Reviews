require "rails_helper"
feature "As an admin, I want to be able to delete reviews", %{
  [ ]I must be signed in
  [ ]I must be on the details page for a specific beer
  [ ]I must be able to delete a review by clicking the delete button
  [ ]After deleting a review, the page will re-render
} do
  scenario "successfully delete review" do
    admin = FactoryGirl.create(:user, role: "admin")
    review = FactoryGirl.create(:review)

    visit root_path
    sign_in_as(admin)
    click_link review.beer.name
    click_link "Delete Review"

    expect(page).to have_content("Your review has been deleted!")
    expect(page).to_not have_content(review.description)
  end
end
