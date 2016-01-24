class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :image_url
      t.string :instagram_url
      t.string :flickr_url
      t.string :facebook_url
      t.string :audio_url
      t.string :soundcloud_url
      t.string :video_url
      t.string :youtube_url
      t.string :vimeo_url
      t.string :title
      t.string :description
      t.string :creator_name
      t.string :creator_url
      t.date :published_at

      t.string :type
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
