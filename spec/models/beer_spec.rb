require 'rails_helper'

RSpec.describe Beer, type: :model do
  it { should belong_to :style }
  it { should belong_to :user }

  it { should have_valid(:name).when("Lagunitas", "Heineken") }
  it { should_not have_valid(:name).when(nil, "") }

  it { should have_valid(:user).when(User.new) }
  it { should_not have_valid(:user).when(nil) }

  it { should have_valid(:style).when(Style.new) }
  it { should_not have_valid(:style).when(nil) }
end
