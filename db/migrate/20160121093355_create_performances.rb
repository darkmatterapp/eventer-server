class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|
      t.text :name
      t.text :description
      t.datetime :starts_at
      t.datetime :ends_at

      t.integer :event_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
