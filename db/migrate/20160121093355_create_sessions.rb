class CreateSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :sessions do |t|
      t.text :name
      t.text :description
      t.datetime :starts_at
      t.datetime :ends_at

      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.references :location, foreign_key: true

      t.timestamps null: false
    end
  end
end
