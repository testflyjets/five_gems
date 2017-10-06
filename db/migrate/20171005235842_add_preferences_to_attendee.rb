class AddPreferencesToAttendee < ActiveRecord::Migration[5.0]
  def change
    add_column :attendees, :preferences, :jsonb, null: false, default: {}
  end
end
