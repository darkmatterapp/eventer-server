class CreateSponsors < ActiveRecord::Migration[5.1]
  def change
    create_table :sponsors do |t|
      t.string :name
      t.string :logo
      t.string :url
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
