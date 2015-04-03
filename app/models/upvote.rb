class Upvote < ActiveRecord::Base
  belongs_to :user
  belongs_to :review, counter_cache: true

  validates :user_id, presence: true, uniqueness: { scope: :review_id }
  validates :review_id, presence: true
end
