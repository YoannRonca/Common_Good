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

ActiveRecord::Schema.define(version: 2019_02_28_143703) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "mission_sectors", force: :cascade do |t|
    t.bigint "mission_id"
    t.bigint "sector_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mission_id"], name: "index_mission_sectors_on_mission_id"
    t.index ["sector_id"], name: "index_mission_sectors_on_sector_id"
  end

  create_table "mission_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "mission_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mission_id"], name: "index_mission_users_on_mission_id"
    t.index ["user_id"], name: "index_mission_users_on_user_id"
  end

  create_table "missions", force: :cascade do |t|
    t.string "city"
    t.string "continent"
    t.string "country"
    t.string "climate"
    t.string "great_for"
    t.string "cost_of_life"
    t.string "safety"
    t.string "tolerance"
    t.string "skill"
    t.string "language"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organization_id"
    t.integer "global_rating"
    t.string "title"
    t.string "description"
    t.string "photo"
    t.string "home_category"
    t.index ["organization_id"], name: "index_missions_on_organization_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "transparency"
    t.integer "social_impact"
    t.integer "staff_note"
    t.bigint "mission_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mission_id"], name: "index_reviews_on_mission_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "sectors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "country"
    t.date "birth_date"
    t.integer "phone_number"
    t.text "description"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "mission_sectors", "missions"
  add_foreign_key "mission_sectors", "sectors"
  add_foreign_key "mission_users", "missions"
  add_foreign_key "mission_users", "users"
  add_foreign_key "reviews", "missions"
  add_foreign_key "reviews", "users"
end
