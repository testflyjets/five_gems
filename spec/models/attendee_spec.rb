require 'rails_helper'

RSpec.describe Attendee, type: :model do
  describe 'events near me' do
    let(:attendee) { create(:attendee) }
    let(:event)    { create(:event) }

    it 'near event should be near me' do
      distance = attendee.distance_to_event(event)
      puts "\n\nDistance to event: #{distance}"

      expect(distance).to be < 20
    end
  end
end
