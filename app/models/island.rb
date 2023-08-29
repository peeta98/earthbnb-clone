class Island < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :title, :address, :description, presence: :true
  validates :price_per_night, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
