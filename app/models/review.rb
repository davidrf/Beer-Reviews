class Review < ActiveRecord::Base
  belongs_to :beer
  belongs_to :user
  validates :rating, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
  validates :beer_id, presence: true
end
