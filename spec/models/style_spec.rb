require 'rails_helper'

RSpec.describe Style, type: :model do
  it { should have_many :beers }

  it { should have_valid(:name).when("New Style") }
  it { should_not have_valid(:name).when(nil, "") }
end
