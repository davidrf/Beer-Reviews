class Beer < ActiveRecord::Base
  include Authorization
  has_many :reviews, dependent: :destroy
  belongs_to :style
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :style, presence: true
  validates :user, presence: true
  validates :description, length: { maximum: 5000 }
end
