class Event < ApplicationRecord
  acts_as_paranoid
  
  def today?
    self.start_time.today?
  end

  def recent?
    (Time.now - self.start_time) <= 1.week
  end
end
