class Attendee < ApplicationRecord
  include Storext.model

  # store_attributes :preferences do
  #   # vegan Boolean, default: false
  #   seats Integer, default: 0
  # end

  geocoded_by :full_address
  after_validation :geocode,
    if: ->(obj){ obj.full_address.present? and obj.full_address_changed? }

  def distance_to_event(event)
    self.distance_to(event)
  end

  def events_near_me
    Event.near([self.latitude, self.longitude], 25).all
  end
end
