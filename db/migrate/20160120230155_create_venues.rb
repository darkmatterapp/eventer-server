class CreateVenues < ActiveRecord::Migration[5.1]
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

      t.references :user, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps null: false
    end
  end
end
