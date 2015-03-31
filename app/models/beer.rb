class Beer < ActiveRecord::Base
  has_many :reviews
  belongs_to :style
  belongs_to :user
  validates :name, presence: true
  validates :style_id, presence: true
  validates :user_id, presence: true
end
