class Beer < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  belongs_to :style
  belongs_to :user

  validates :name, presence: true
  validates :style, presence: true
  validates :user, presence: true
end
