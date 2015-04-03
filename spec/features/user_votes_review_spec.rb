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
    click_link "Up"

    expect(page).to have_content("Beers on the wall: 1")
    expect(page).to have_content("Beers off the wall: 0")
  end

  scenario "successfully upvotes a beer" do
    user = FactoryGirl.create(:user)
    review = FactoryGirl.create(:review)

    visit root_path
    sign_in_as(user)
    click_link review.beer.name
    click_link "Up"
    click_link "Down"

    expect(page).to have_content("Beers on the wall: 0")
    expect(page).to have_content("Beers off the wall: 1")
  end
end
