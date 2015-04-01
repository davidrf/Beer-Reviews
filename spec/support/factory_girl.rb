require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    role 'user'
  end

  factory :beer do
    name "Magic Hat"
    abv 5
    ibu 60
    description "Super hoppy goodness"
    style
    user
  end

  factory :review do
    rating "7"
    description "I love this beer so much"
    user
    beer
  end

  factory :style do
    sequence(:name) { |n| "IPA #{n}" }
  end
end
