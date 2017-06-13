class CreatePerformances < ActiveRecord::Migration[4.2]
  def change
    create_table :performances do |t|
      t.text :name
      t.text :description
      t.datetime :starts_at
      t.datetime :ends_at

      t.integer :user_id
      t.integer :event_id
      t.integer :location_id

      t.timestamps null: false
    end
  end
end
