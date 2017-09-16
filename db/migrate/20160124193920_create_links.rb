class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.text :url
      t.text :title
      t.text :content
      t.string :creator_name
      t.text :creator_url
      t.text :creator_photo
      t.datetime :published_at

      t.references :user, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps null: false
    end
  end
end
