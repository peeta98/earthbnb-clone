class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :island
  validates :start_date, presence: true
  validates :end_date, presence: true, comparison: { greater_than: :start_date }

  validates :status, inclusion: { in: ["Pending", "Accepted", "Declined"] }
  def decline!
    update(status: 'Declined')
  end
end
