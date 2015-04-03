class Downvote < ActiveRecord::Base
  belongs_to :user
  belongs_to :review, counter_cache: true

  validates :user_id, presence: true, uniqueness: { scope: :review_id }
  validates :review_id, presence: true

  def has_upvoted?(user)
    if review.upvotes.find_by(user_id: user)
      review.upvotes.find_by(user_id: user).destroy
    end
  end

end
