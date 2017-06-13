class CreateVenues < ActiveRecord::Migration[4.2]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :nickname
      t.string :street_address
      t.string :extended_address
      t.string :locality
      t.string :region
      t.string :postal_code
      t.string :country
      t.string :phone
      t.text :url
      t.string :twitter
      t.string :instagram
      t.string :facebook
      t.string :latitude
      t.string :longitude
      t.string :altitude

      t.integer :user_id
      t.integer :event_id

      t.timestamps null: false
    end
  end
end
