class Review < ActiveRecord::Base
  include Authorization
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
    user_downvote = downvotes.find_by(user_id: user)
    user_upvote = upvotes.find_by(user_id: user)
    user_downvote.destroy if user_downvote
    user_upvote.destroy if user_upvote
  end
end
