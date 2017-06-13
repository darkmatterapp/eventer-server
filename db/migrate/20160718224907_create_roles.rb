class CreateRoles < ActiveRecord::Migration[4.2][5.0]
  def change
    create_table :roles do |t|
      t.string :name
      t.references :event, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
