class Beer < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  belongs_to :style
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :style, presence: true
  validates :user, presence: true
  validates :description, length: { maximum: 5000 }

  def owner_or_admin?(logged_in_user)
    return false unless logged_in_user
    user == logged_in_user || "admin" == logged_in_user.role
  end
end
