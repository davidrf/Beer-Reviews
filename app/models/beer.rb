class Beer < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  belongs_to :style
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :style, presence: true
  validates :user, presence: true
  validates :description, length: { maximum: 5000 }

  def amendable?(logged_in_user)
    logged_in_user == user || logged_in_user.admin?
  end
end
