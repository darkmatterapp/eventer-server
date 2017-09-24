class AddNewFieldsToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :start_date, :date
    add_column :events, :end_date, :date
    add_column :events, :city, :string
    add_column :events, :state, :string
    add_column :events, :iterator, :string
    add_column :events, :summary, :string
    add_column :events, :slug, :string
    add_column :events, :twitter, :string
    add_column :events, :instagram, :string
    add_column :events, :facebook, :string
  end
end
