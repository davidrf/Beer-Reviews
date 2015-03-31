require 'spec_helper'

feature 'User edits review', %Q{
  As a user, I want to be able to edit my review so that it sounds better
  } do

    #I must be signed in
    #I must be the creator of this review
    #I must be able to get here by clicking the edit button next to the review on the details page for a specific beer
    #I will be redirected to a separate page where I can edit the form

    scenario 'successfully edit review' do
      user = FactoryGirl.create(:user_with_review)

      visit root_path
      click_link 'Sign In'
      vist beer_path(@beer)
      click_link 'Edit Review'
      fill_in 'Description', with: 'I really like this beer'
      select '8', from: 'Rating'
      click_button 'Update Review'

      expect(page).to have_content("Your review has been updated!")
    end

    scenario 'unsuccessfully edit review' do
      user = FactoryGirl.create(:user_with_review)

      visit root_path
      click_link 'Sign In'
      visit beer_path(@beer)
      click_link 'Edit Review'
      fill_in 'Description', with: ''
      select '', from: 'Rating'
      click_button 'Update Review'

      expact(page).to_not have_content("Your review has been updated!")
  end
end
