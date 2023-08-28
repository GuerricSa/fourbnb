class Oven < ApplicationRecord
  belongs_to :user
  validates :brand, :address, :description, :price, presence: true
end
