class Booking < ApplicationRecord
  belongs_to :user
  has_one :review, dependent: :destroy
  belongs_to :island
  validates :start_date, presence: true
  validates :end_date, comparison: { greater_than: :start_date }

  validates :status, inclusion: { in: ["Pending", "Accepted", "Declined"] }
  def decline!
    update(status: 'Declined')
  end
end
