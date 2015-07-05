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

ActiveRecord::Schema.define(version: 20150705184316) do

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.integer  "region_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "title_photo_file_name"
    t.string   "title_photo_content_type"
    t.integer  "title_photo_file_size"
    t.datetime "title_photo_updated_at"
    t.string   "utcoffset",                limit: 6
  end

  add_index "cities", ["region_id"], name: "index_cities_on_region_id"

  create_table "photos", force: :cascade do |t|
    t.string   "source",             limit: 255
    t.string   "author",             limit: 255
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "photos", ["city_id"], name: "index_photos_on_city_id"

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", id: false, force: :cascade do |t|
    t.integer "photo_id"
    t.integer "tag_id"
  end

  add_index "taggings", ["photo_id"], name: "index_taggings_on_photo_id"
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id"

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
