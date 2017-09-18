class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :name

      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.references :venue, foreign_key: true

      t.timestamps null: false
    end
  end
end
