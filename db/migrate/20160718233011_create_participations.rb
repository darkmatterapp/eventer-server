class CreateParticipations < ActiveRecord::Migration[5.1]
  def change
    create_table :participations do |t|
      t.references :session, foreign_key: true
      t.references :participant, foreign_key: true
      t.references :role, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps null: false
    end
  end
end
