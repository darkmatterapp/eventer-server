class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :time_zone
      t.text :code_of_conduct

      t.references :user, foreign_key: true

      t.timestamps null: false
    end
  end
end
