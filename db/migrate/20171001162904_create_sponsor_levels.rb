class CreateSponsorLevels < ActiveRecord::Migration[5.1]
  def change
    create_table :sponsor_levels do |t|
      t.string :name
      t.string :description
      t.integer :price

      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
