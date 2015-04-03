class Review < ActiveRecord::Base
  belongs_to :beer
  belongs_to :user
  has_many :upvotes
  has_many :downvotes

  validates :rating, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 10
  }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :user, presence: true
  validates :beer, presence: true

  def owner?(logged_in_user)
    user == logged_in_user
  end

  def vote_terminator(user)
    if downvotes.find_by(user_id: user)
      downvotes.find_by(user_id: user).destroy
    elsif upvotes.find_by(user_id: user)
      upvotes.find_by(user_id: user).destroy
    end
  end
end
