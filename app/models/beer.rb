class Beer < ActiveRecord::Base
  has_many :reviews
  belongs_to :style
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :style, presence: true
  validates :user, presence: true
  validates :description, length: { maximum: 5000 }
end
