# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_10_23_105949) do
  create_table "action_location_types", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "action_id", null: false
    t.bigint "location_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action_id", "location_type_id"], name: "index_action_location_types_on_action_id_and_location_type_id", unique: true
    t.index ["action_id"], name: "index_action_location_types_on_action_id"
    t.index ["location_type_id"], name: "index_action_location_types_on_location_type_id"
  end

  create_table "actions", charset: "utf8mb4", force: :cascade do |t|
    t.text "content", null: false
    t.boolean "released", default: false, null: false
    t.boolean "approved", default: false, null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_actions_on_user_id"
  end

  create_table "activities", charset: "utf8mb4", force: :cascade do |t|
    t.text "content", null: false
    t.boolean "released", default: false, null: false
    t.boolean "approved", default: false, null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "location_types", charset: "utf8mb4", force: :cascade do |t|
    t.integer "location_type", default: 0, null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_type"], name: "index_location_types_on_location_type", unique: true
  end

  create_table "lot_actions", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "action_id", null: false
    t.string "lot_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action_id"], name: "index_lot_actions_on_action_id"
  end

  create_table "lots", id: { type: :string, limit: 36 }, charset: "utf8mb4", force: :cascade do |t|
    t.string "start_point_name"
    t.string "start_point_address"
    t.float "start_point_latitude", null: false
    t.float "start_point_longitude", null: false
    t.string "destination_name"
    t.string "destination_address"
    t.float "destination_latitude"
    t.float "destination_longitude"
    t.json "neaby_locations"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "location_type_id", null: false
    t.index ["user_id"], name: "index_lots_on_user_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.boolean "admin", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "action_location_types", "actions"
  add_foreign_key "action_location_types", "location_types"
  add_foreign_key "actions", "users"
  add_foreign_key "activities", "users"
  add_foreign_key "lot_actions", "actions"
  add_foreign_key "lots", "users"
end
