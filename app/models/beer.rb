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
    style = Style.where("name ilike ?", "%#{query}%")
    brewery = Brewery.where( "name ILIKE ?", "%#{query}%" )
    if style.count > 0
      where(style: style)
    elsif brewery.count > 0
      where(brewery: brewery)
    else
      where("name ilike ?", "%#{query}%")
    end
  end

  def self.search_message
    count = self.count
    if count == 0
      "No Matching Beer"
    end
  end

  def average_rating
    average = reviews.average(:rating)
    average.nil? ? nil : average.round(1)
  end
end
