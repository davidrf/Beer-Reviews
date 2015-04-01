require 'rails_helper'

RSpec.describe Review, type: :model do
  it { should belong_to :beer }
  it { should belong_to :user }

  it { should have_valid(:rating).when(1, "1", "5") }
  it { should_not have_valid(:rating).when(nil, "", 1.5, 0, 11) }

  it { should have_valid(:description).when("Great Beer") }
  it { should_not have_valid(:description).when(nil, "") }

  it { should have_valid(:user).when(User.new) }
  it { should_not have_valid(:user).when(nil) }

  it { should have_valid(:beer).when(Beer.new) }
  it { should_not have_valid(:beer).when(nil) }
end
