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

ActiveRecord::Schema.define(version: 20160719021258) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "time_zone"
    t.text "code_of_conduct"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "links", force: :cascade do |t|
    t.text "url"
    t.text "title"
    t.text "content"
    t.string "creator_name"
    t.text "creator_url"
    t.text "creator_photo"
    t.datetime "published_at"
    t.bigint "user_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_links_on_event_id"
    t.index ["user_id"], name: "index_links_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.bigint "event_id"
    t.bigint "venue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_locations_on_event_id"
    t.index ["user_id"], name: "index_locations_on_user_id"
    t.index ["venue_id"], name: "index_locations_on_venue_id"
  end

  create_table "media", force: :cascade do |t|
    t.string "image_url"
    t.string "instagram_url"
    t.string "flickr_url"
    t.string "facebook_url"
    t.string "audio_url"
    t.string "soundcloud_url"
    t.string "vine_url"
    t.string "video_url"
    t.string "youtube_url"
    t.string "vimeo_url"
    t.string "title"
    t.string "description"
    t.string "creator_name"
    t.text "creator_url"
    t.text "creator_photo"
    t.date "published_at"
    t.string "type"
    t.bigint "user_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_media_on_event_id"
    t.index ["user_id"], name: "index_media_on_user_id"
  end

  create_table "participants", force: :cascade do |t|
    t.string "name"
    t.text "photo"
    t.text "bio"
    t.text "url"
    t.string "twitter"
    t.string "instagram"
    t.string "facebook"
    t.string "youtube"
    t.string "vimeo"
    t.string "bandcamp"
    t.bigint "user_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_participants_on_event_id"
    t.index ["user_id"], name: "index_participants_on_user_id"
  end

  create_table "participants_sessions", id: false, force: :cascade do |t|
    t.bigint "participant_id"
    t.bigint "session_id"
    t.index ["participant_id"], name: "index_participants_sessions_on_participant_id"
    t.index ["session_id"], name: "index_participants_sessions_on_session_id"
  end

  create_table "participations", force: :cascade do |t|
    t.bigint "session_id"
    t.bigint "participant_id"
    t.bigint "role_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_participations_on_event_id"
    t.index ["participant_id"], name: "index_participations_on_participant_id"
    t.index ["role_id"], name: "index_participations_on_role_id"
    t.index ["session_id"], name: "index_participations_on_session_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_roles_on_event_id"
  end

  create_table "rsvps", force: :cascade do |t|
    t.text "content"
    t.integer "attending"
    t.bigint "participant_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_rsvps_on_event_id"
    t.index ["participant_id"], name: "index_rsvps_on_participant_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.bigint "user_id"
    t.bigint "event_id"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_sessions_on_event_id"
    t.index ["location_id"], name: "index_sessions_on_location_id"
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.string "nickname"
    t.string "street_address"
    t.string "extended_address"
    t.string "locality"
    t.string "region"
    t.string "postal_code"
    t.string "country"
    t.string "phone"
    t.text "url"
    t.string "twitter"
    t.string "instagram"
    t.string "facebook"
    t.string "latitude"
    t.string "longitude"
    t.string "altitude"
    t.bigint "user_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_venues_on_event_id"
    t.index ["user_id"], name: "index_venues_on_user_id"
  end

  add_foreign_key "events", "users"
  add_foreign_key "links", "events"
  add_foreign_key "links", "users"
  add_foreign_key "locations", "events"
  add_foreign_key "locations", "users"
  add_foreign_key "locations", "venues"
  add_foreign_key "media", "events"
  add_foreign_key "media", "users"
  add_foreign_key "participants", "events"
  add_foreign_key "participants", "users"
  add_foreign_key "participants_sessions", "participants"
  add_foreign_key "participants_sessions", "sessions"
  add_foreign_key "participations", "events"
  add_foreign_key "participations", "participants"
  add_foreign_key "participations", "roles"
  add_foreign_key "participations", "sessions"
  add_foreign_key "roles", "events"
  add_foreign_key "rsvps", "events"
  add_foreign_key "rsvps", "participants"
  add_foreign_key "sessions", "events"
  add_foreign_key "sessions", "locations"
  add_foreign_key "sessions", "users"
  add_foreign_key "venues", "events"
  add_foreign_key "venues", "users"
end
