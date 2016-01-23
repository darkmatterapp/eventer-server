# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160123204248) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.string   "nickname"
    t.string   "street_address"
    t.string   "extended_address"
    t.string   "locality"
    t.string   "region"
    t.string   "postal_code"
    t.string   "country"
    t.string   "phone"
    t.text     "url"
    t.string   "twitter"
    t.string   "instagram"
    t.string   "facebook"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "altitude"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "media", force: :cascade do |t|
    t.string   "image_url"
    t.string   "instagram_url"
    t.string   "flick_url"
    t.string   "facebook_url"
    t.string   "audio_url"
    t.string   "soundcloud_url"
    t.string   "video_url"
    t.string   "youtube_url"
    t.string   "vimeo_url"
    t.string   "title"
    t.string   "description"
    t.string   "creator_name"
    t.string   "creator_url"
    t.datetime "published_at"
    t.boolean  "private"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.text     "photo"
    t.text     "bio"
    t.text     "url"
    t.string   "twitter"
    t.string   "instagram"
    t.string   "facebook"
    t.string   "youtube"
    t.string   "vimeo"
    t.string   "bandcamp"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "performances", force: :cascade do |t|
    t.text     "name"
    t.text     "description"
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
