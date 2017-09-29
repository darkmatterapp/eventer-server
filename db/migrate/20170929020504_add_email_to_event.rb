class AddEmailToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :email, :string
  end
end
