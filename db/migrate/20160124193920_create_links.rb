class CreateLinks < ActiveRecord::Migration[4.2]
  def change
    create_table :links do |t|
      t.text :url
      t.text :title
      t.text :content
      t.string :creator_name
      t.text :creator_url
      t.text :creator_photo
      t.datetime :published_at

      t.integer :user_id
      t.integer :event_id

      t.timestamps null: false
    end
  end
end
