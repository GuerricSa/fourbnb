class Booking < ApplicationRecord
  STATUS = %w[pending accepted declined].freeze
  belongs_to :oven
  belongs_to :user
  # belongs_to :owner

  validates_associated :oven
  validates_associated :user
  validates :date, presence: true
  validates :status, inclusion: { in: STATUS }
  validates :date, uniqueness: { scope: :oven }
  validates :date, uniqueness: { scope: :user }
end
