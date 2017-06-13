class CreateParticipations < ActiveRecord::Migration[4.2][5.0]
  def change
    create_table :participations do |t|
      t.references :performance, foreign_key: true
      t.references :person, foreign_key: true
      t.references :role, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
