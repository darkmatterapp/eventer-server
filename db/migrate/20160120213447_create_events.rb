class CreateEvents < ActiveRecord::Migration[4.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :time_zone
      
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
