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

ActiveRecord::Schema.define(version: 20150301201252) do

  create_table "beers", force: :cascade do |t|
    t.text     "beer_name",    default: "new beer"
    t.text     "beer_type"
    t.integer  "user_id"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.integer  "phaseX"
    t.text     "phase_array"
    t.integer  "total_phases"
    t.text     "photo_url",    default: "/assets/beer_glasses.jpg"
    t.integer  "bottles"
    t.text     "beer_notes",   default: "add brew details here."
  end

  create_table "boils", force: :cascade do |t|
    t.text     "temps"
    t.integer  "user_id"
    t.integer  "beer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chills", force: :cascade do |t|
    t.text     "temps"
    t.integer  "user_id"
    t.integer  "beer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ferments", force: :cascade do |t|
    t.text     "temps"
    t.integer  "user_id"
    t.integer  "beer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lagers", force: :cascade do |t|
    t.text     "temps"
    t.integer  "user_id"
    t.integer  "beer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mashes", force: :cascade do |t|
    t.text     "temps"
    t.integer  "user_id"
    t.integer  "beer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sparges", force: :cascade do |t|
    t.text     "temps"
    t.integer  "user_id"
    t.integer  "beer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.text     "username"
    t.text     "email"
    t.text     "firstName"
    t.text     "lastName"
    t.text     "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "beer_id"
  end

end
