class CreateRsvps < ActiveRecord::Migration[5.0]
  def change
    create_table :rsvps do |t|
      t.references :person, foreign_key: true
      t.integer :attending
      t.text :content
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
