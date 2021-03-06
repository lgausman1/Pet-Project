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

ActiveRecord::Schema.define(version: 20150625181342) do

  create_table "pets", force: :cascade do |t|
    t.string   "name"
    t.string   "link"
    t.string   "shelter_location"
    t.string   "shelter_url"
    t.string   "thumbnail"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "breed"
    t.string   "species"
    t.integer  "age"
    t.integer  "weight"
    t.string   "gender"
    t.string   "personality"
    t.string   "activity_level"
    t.string   "description"
    t.string   "shelter_id"
  end

  create_table "preferences", force: :cascade do |t|
    t.string   "cat_or_dog"
    t.string   "activity_level"
    t.string   "young_children"
    t.string   "size_of_home"
    t.string   "time_with_pet"
    t.string   "training_pet"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
  end

  create_table "user_pets", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "pet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_pets", ["pet_id"], name: "index_user_pets_on_pet_id"
  add_index "user_pets", ["user_id"], name: "index_user_pets_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "survey_info"
    t.string   "photo_url"
  end

end
