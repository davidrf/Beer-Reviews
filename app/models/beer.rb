class Beer < ActiveRecord::Base
  include Authorization

  mount_uploader :image, BeerUploader

  has_many :reviews, dependent: :destroy
  belongs_to :style
  belongs_to :brewery
  belongs_to :user

  validates :name, presence: true, uniqueness: { scope: :brewery }
  validates :style, presence: true
  validates :brewery, presence: true
  validates :user, presence: true
  validates :description, length: { maximum: 5000 }

  def self.search(query)
    where("name ilike ?", "%#{query}%")
  end

  def self.search_message
    count = self.count
    if count == 0
      "No Matching Beer"
    end
  end

  def average_rating
    if self.reviews.average(:rating) == nil
      self.reviews.average(:rating)
    else
      self.reviews.average(:rating).round(1)
    end
  end
end
