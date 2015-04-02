class Review < ActiveRecord::Base
  belongs_to :beer
  belongs_to :user

  validates :rating, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 10
  }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :user, presence: true
  validates :beer, presence: true

  def amendable?(logged_in_user)
    logged_in_user == user || logged_in_user.admin?
  end
end
