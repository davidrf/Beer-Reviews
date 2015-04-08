require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    role 'user'
  end

  factory :beer do
    sequence(:name) { |n| "Magic Hat #{n}" }
    abv 5
    ibu 60
    description "Super hoppy goodness"
    style
    brewery
    user
  end

  factory :review do
    rating "7"
    sequence(:description) { |n| "I love this beer #{n}" }
    user
    beer
  end

  factory :style do
    sequence(:name) { |n| "IPA #{n}" }
  end

  factory :brewery do
    sequence(:name) { |n| "Victory Brewing Company #{n}" }
    city "Downingtown"
    state "PA"
    country "United States"
    description "One of my favorites"
  end
end
