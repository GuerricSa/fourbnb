class Oven < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy

  validates :brand, :address, :description, :price, presence: true
  has_many_attached :photos

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def moyenne
    ratings = []
    if self.reviews.size > 0
      self.reviews.each do |review|
        ratings << review.rating
      end
      return ratings.sum.fdiv(ratings.size).round(1)
    else
      return ""
    end
  end

  def nb_avis
    self.reviews.size
  end
end
