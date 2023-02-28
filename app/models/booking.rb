class Booking < ApplicationRecord
  belongs_to :flat
  validates :start_date, presence: true, future: true, comparison: { greater_than: :end_date }
  validates :end_date, presence: true, future: true
end
