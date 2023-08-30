class Island < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  has_many_attached :photos

  validates :title, :address, :description, presence: true
  validates :price_per_night, presence: true, numericality: { only_integer: true }
end
