class Oven < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy

  validates :brand, :address, :description, :price, presence: true
  has_many_attached :photos
end
