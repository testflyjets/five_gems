class Event < ApplicationRecord

  acts_as_paranoid

  geocoded_by :full_address
  after_validation :geocode,
    if: ->(obj){ obj.full_address.present? and obj.full_address_changed? }

  def today?
    self.start_time.today?
  end

  def recent?
    (Time.now - self.start_time) <= 1.week
  end
end
