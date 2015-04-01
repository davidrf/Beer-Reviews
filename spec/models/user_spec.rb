require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many :reviews }
  it { should have_many :beers }

  it { should have_valid(:email).when("dabomb@gmail.com", "hi@yahoo.com") }
  it { should_not have_valid(:email).when(nil, "", "dabomb", "dabomb@", "dabomb@gmail", "@gmail.com", ".com") }

  it { should have_valid(:password).when("password") }
  it { should_not have_valid(:password).when(nil, "") }
end
