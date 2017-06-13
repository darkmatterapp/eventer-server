class CreateLocations < ActiveRecord::Migration[4.2]
  def change
    create_table :locations do |t|
      t.string :name

      t.integer :user_id
      t.integer :event_id
      t.integer :venue_id

      t.timestamps null: false
    end
  end
end
