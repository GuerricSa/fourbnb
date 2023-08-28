class Oven < ApplicationRecord
  belongs_to :user
  validates :brand, :address, :description, :price, presence: true
  has_many_attached :photos
end
