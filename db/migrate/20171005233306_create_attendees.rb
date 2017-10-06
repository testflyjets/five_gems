class CreateAttendees < ActiveRecord::Migration[5.0]
  def change
    create_table :attendees do |t|
      t.string :name
      t.string :full_address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
