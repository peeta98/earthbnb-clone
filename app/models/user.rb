class User < ApplicationRecord
  has_many :islands, dependent: :destroy
  has_many :bookings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def last_booking_on_island(island)
    Booking.where(user: self, island: island)&.last
  end

  validates :username, presence: true, uniqueness: true, length: { minimum: 6 }
end
