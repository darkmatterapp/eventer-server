class CreateParticipants < ActiveRecord::Migration[5.1]
  def change
    create_table :participants do |t|
      t.string :name
      t.text :photo
      t.text :bio
      t.text :url
      t.string :twitter
      t.string :instagram
      t.string :facebook
      t.string :youtube
      t.string :vimeo
      t.string :bandcamp

      t.references :user, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps null: false
    end
  end
end
