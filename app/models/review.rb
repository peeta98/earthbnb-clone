class Review < ApplicationRecord
  belongs_to :booking
  validates :rating, numericality: true, comparison: { greater_than_or_equal_to: 0 }
  validates :content, presence: true
end
