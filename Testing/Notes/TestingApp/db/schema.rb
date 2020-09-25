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

ActiveRecord::Schema.define(version: 2020_09_17_165527) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.integer "capy_id"
    t.string "party_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["capy_id"], name: "index_attendances_on_capy_id"
    t.index ["party_id", "capy_id"], name: "index_attendances_on_party_id_and_capy_id", unique: true
  end

  create_table "capies", force: :cascade do |t|
    t.string "name", null: false
    t.string "color", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "capys", force: :cascade do |t|
    t.string "name", null: false
    t.string "color", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parties", force: :cascade do |t|
    t.integer "capy_id", null: false
    t.string "occasion", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["capy_id"], name: "index_parties_on_capy_id"
  end

  create_table "test_models", force: :cascade do |t|
    t.string "name", null: false
    t.string "color", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
