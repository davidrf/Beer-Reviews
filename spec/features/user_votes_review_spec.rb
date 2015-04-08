require "rails_helper"
feature "As a user, I want to vote on reviews", %{
  [ ] I must be signed in
  [ ] I must be on the details page for a specific beer
  [ ] I must be able to upvote/downvote only once
  [ ] I am allowed to change my vote
} do
  scenario "successfully upvotes a beer" do
    user = FactoryGirl.create(:user)
    review = FactoryGirl.create(:review)

    visit root_path
    sign_in_as(user)
    click_link review.beer.name
    find("#upvote").click

    expect(page).to have_content("1 beer(s) on the wall")
  end

  scenario "successfully downvotes a beer" do
    user = FactoryGirl.create(:user)
    review = FactoryGirl.create(:review)

    visit root_path
    sign_in_as(user)
    click_link review.beer.name
    find("#upvote").click
    find("#downvote").click

    expect(page).to have_content("0 beer(s) on the wall")
  end
end
