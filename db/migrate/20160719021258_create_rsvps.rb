class CreateRsvps < ActiveRecord::Migration[5.1]
  def change
    create_table :rsvps do |t|
      t.text :content
      t.integer :attending

      t.references :participant, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps null: false
    end
  end
end
