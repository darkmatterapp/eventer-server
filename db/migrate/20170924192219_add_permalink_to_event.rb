class AddPermalinkToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :permalink, :string
    add_index :events, :permalink
  end
end
