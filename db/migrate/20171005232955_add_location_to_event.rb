class AddLocationToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :full_address, :string
  end
end
