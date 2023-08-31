class Island < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_title_and_address, against: [:title, :address],
  using: {
    tsearch: { prefix: true }
  }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy
  has_many_attached :photos

  validates :title, :address, :description, presence: true
  validates :price_per_night, presence: true, numericality: { only_integer: true }
end
