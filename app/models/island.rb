class Island < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  has_many_attached :photos

  validates :title, :address, :description, presence: true
  validates :price_per_night, presence: true, numericality: { only_integer: true }
end
