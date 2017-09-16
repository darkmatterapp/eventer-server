class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.string :name
      t.text :description

      t.references :event, foreign_key: true

      t.timestamps null: false
    end
  end
end
