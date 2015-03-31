require "rails_helper"

feature "User edits review", %{
  As a user, I want to be able to edit my review so that it sounds better
  } do

    # I must be signed in
    # I must be the creator of this review
    # I must be able to get here by clicking the edit button next to the review on the details page for a specific beer
    # I will be redirected to a separate page where I can edit the form

    scenario "successfully edit review" do
      review = FactoryGirl.create(:review)
      beer = FactoryGirl.create(:beer)
      user = review.user

      visit root_path
      click_link "Sign In"
      click_link beer.name
      click_button "Edit Review"
      fill_in "Description", with: "I really like this beer"
      select "8", from: "Rating"
      click_button "Update Review"

      expect(page).to have_content("Your review has been updated!")
    end

    scenario "unsuccessfully edit review" do
      review = FactoryGirl.create(:review)
      beer = FactoryGirl.create(:beer)
      user = review.user

      visit root_path
      click_link "Sign In"
      click_link beer.name
      click_button "Edit Review"
      click_button "Update Review"

      expect(page).to have_content("Invalid Information!")
      expect(page).to_not have_content("Your review has been updated!")
    end

    scenario "edit review without signing in" do
      review = FactoryGirl.create(:review)
      beer = FactoryGirl.create(:beer)
      user = review.user

      visit root_path
      click_link beer.name

      expect(page).to_not have_content(edit.review)
    end
end
