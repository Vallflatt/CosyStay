class Booking < ApplicationRecord
  belongs_to :flat
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :dates_in_future
  has_one :flat


  private

  def dates_in_future

    if start_date > end_date
      errors.add(:start_date, "start date can't be after end date")
    elsif start_date < Date.today
      errors.add(:start_date, "start date can't be in the past")
    end
  end
end
