# require "rails_helper"
# feature "As an admin, I want to be able to delete all reviews", %{
#   [ ]I must be signed in
#   [ ]I must be on the details page for a specific beer
#   [ ]I must be able to delete a review by clicking the delete button
#   [ ]After deleting a review, the page will re-render
# } do
#   scenario "successfully deleted all reviews" do
#     admin = FactoryGirl.create(:admin)
#     review = FactoryGirl.create(:review)
#
#     visit root_path
#     click_link "Sign In"
#     fill_in "Email", with: admin.email
#     fill_in "Password", with: admin.password
#     click_link review.beer.name
#     click_link "Delete Reviews"
#     expect(page).to have_content("Reviews Successfully Deleted")
#     expect(page).to_not have_content(review.description)
#   end
#
#   scenario "unsuccessfully delete all reviews" do
#     user = FactoryGirl.create(:user)
#     review = FactoryGirl.create(:review)
#
#     visit root_path
#     click_link "Sign In"
#     fill_in "Email", with: user.email
#     fill_in "Password", with: user.password
#     click_link review.beer.name
#     expect(page).to_not have_content("Delete Reviews")
#   end
# end
