require "rails_helper"
feature "As a user,I want to review a beer,
so I could let the beer owner know I hate his/her beer",%{
  [ ] I should be able post a review
  [ ] It must send an email to the owner of the beer
} do
  scenario "user review submits email" do
    ActionMailer::Base.deliveries.clear

    beer = FactoryGirl.create(:beer)
    user = FactoryGirl.create(:user)

    visit root_path

    sign_in_as(user)

    visit new_beer_review_path(beer)

    fill_in "Description", with: "Total garbage."
    click_button "Submit Review"

    expect(page).to have_content("Total garbage.")
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end
