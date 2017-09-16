class CreateParticipantsSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :participants_sessions, id: false do |t|
      t.references :participant, foreign_key: true
      t.references :session, foreign_key: true
    end
  end
end
