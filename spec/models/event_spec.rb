require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'event happening today' do
    it 'should happen today' do
      event = create(:event)

      expect(event.today?).to be true
    end

    it 'should happen today (Timecop)' do
      time = Time.local(2017, 10, 5, 23, 59, 59.99999)

      Timecop.freeze(time) do
        event = create(:event, start_time: Time.now)

        expect(event.today?).to be true
      end
    end
  end

  describe 'recent event' do
    # it 'should be a recent event' do
    #   event = create(:event, start_time: Time.now - 6.days)
    #
    #   expect(event.recent?).to be true
    # end

    # it 'should be a recent event (Timecop)' do
    #   time = Time.local(2017, 10, 5, 19, 0, 0)
    #
    #   Timecop.freeze(time) do
    #     event = create(:event, start_time: Time.now - 1.week)
    #
    #     expect(event.recent?).to be true
    #   end
    # end
  end

  describe 'acts_as_paranoid' do
    it 'should just mark events as deleted' do
      event = create(:event, name: 'ParanoidEvent')

      expect(event.today?).to be true

      event.destroy

      deleted_event = Event.find_by_name('ParanoidEvent')
      expect(deleted_event).to be nil

      deleted_event = Event.with_deleted.find_by_name('ParanoidEvent')

      expect(deleted_event).to be

    end

    it 'should recover an event' do
      event = create(:event, name: 'DeletedEvent')

      event.destroy

      deleted_event = Event.find_by_name('DeletedEvent')
      expect(deleted_event).to be nil

      event.recover

      expect(event.deleted_at).to be nil
    end
  end
end
