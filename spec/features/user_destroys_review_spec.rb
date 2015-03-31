require 'spec_helper'

feature 'User deletes review', %Q{
  As a user, I want to be able to delete my review so that others don’t have to see how dumb I am
  } do

    #I must be signed in
    #I must be the creator of this review
    #I must be on the details page for a specific beer
    #I must be able to delete the review by clicking the delete button
    #After deleting the review, the page will re-render

    scenario 'successfully delete review' do
      user = FactoryGirl.create(:user_with_review)

      visit root_path
      click_link 'Sign In'
      vist beer_path(@beer)
      click_button 'Delete Review'

      expect(page).to have_content("Your review has been deleted!")
    end

    scenario 'unsuccessfully delete review' do
      user = FactoryGirl.create(:user_with_review)

      visit beer_path(@beer)
      click_button 'Delete Review'

      expact(page).to_not have_content("Your review has been deleted!")
    end
  end
