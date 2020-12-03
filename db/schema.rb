# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_02_205605) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "badges", force: :cascade do |t|
    t.integer "target"
    t.string "name"
    t.string "description"
    t.string "picture_path"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "breakfasts", force: :cascade do |t|
    t.boolean "local", default: false
    t.string "picture_path"
    t.bigint "foodtype_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["foodtype_id"], name: "index_breakfasts_on_foodtype_id"
  end

  create_table "challenges", force: :cascade do |t|
    t.string "message"
    t.integer "nb_days_veggie"
    t.integer "nb_days_local"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "challengesets", force: :cascade do |t|
    t.integer "start_date"
    t.string "status", default: "pending"
    t.bigint "challenge_id", null: false
    t.bigint "friend_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["challenge_id"], name: "index_challengesets_on_challenge_id"
    t.index ["friend_id"], name: "index_challengesets_on_friend_id"
  end

  create_table "collections", force: :cascade do |t|
    t.integer "counter"
    t.bigint "badge_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["badge_id"], name: "index_collections_on_badge_id"
    t.index ["user_id"], name: "index_collections_on_user_id"
  end

  create_table "days", force: :cascade do |t|
    t.date "date"
    t.bigint "user_id", null: false
    t.bigint "breakfast_id", null: false
    t.bigint "lunch_id", null: false
    t.bigint "dinner_id", null: false
    t.bigint "status_id", null: false
    t.bigint "week_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["breakfast_id"], name: "index_days_on_breakfast_id"
    t.index ["dinner_id"], name: "index_days_on_dinner_id"
    t.index ["lunch_id"], name: "index_days_on_lunch_id"
    t.index ["status_id"], name: "index_days_on_status_id"
    t.index ["user_id"], name: "index_days_on_user_id"
    t.index ["week_id"], name: "index_days_on_week_id"
  end

  create_table "dinners", force: :cascade do |t|
    t.boolean "local", default: false
    t.string "picture_path"
    t.bigint "foodtype_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["foodtype_id"], name: "index_dinners_on_foodtype_id"
  end

  create_table "foodtypes", force: :cascade do |t|
    t.string "name"
    t.string "picture_path"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "friends", force: :cascade do |t|
    t.bigint "friend1_user_id", null: false
    t.bigint "friend2_user_id", null: false
    t.string "status", default: "pending"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["friend1_user_id"], name: "index_friends_on_friend1_user_id"
    t.index ["friend2_user_id"], name: "index_friends_on_friend2_user_id"
  end

  create_table "lunches", force: :cascade do |t|
    t.boolean "local", default: false
    t.string "picture_path"
    t.bigint "foodtype_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["foodtype_id"], name: "index_lunches_on_foodtype_id"
  end

  create_table "objectives", force: :cascade do |t|
    t.integer "veggies_days"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_objectives_on_user_id"
  end

  create_table "quotes", force: :cascade do |t|
    t.string "phrases"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string "title"
    t.string "preparation_time"
    t.string "ingredients"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "url_photo"
  end

  create_table "statuses", force: :cascade do |t|
    t.integer "veggie"
    t.integer "local"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "nickname"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "weeks", force: :cascade do |t|
    t.integer "week_nb"
    t.integer "year"
    t.integer "counter_veggies_days"
    t.integer "counter_locals_days"
    t.boolean "veggie_obj_achieved"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "breakfasts", "foodtypes"
  add_foreign_key "challengesets", "challenges"
  add_foreign_key "challengesets", "friends"
  add_foreign_key "collections", "badges"
  add_foreign_key "collections", "users"
  add_foreign_key "days", "breakfasts"
  add_foreign_key "days", "dinners"
  add_foreign_key "days", "lunches"
  add_foreign_key "days", "statuses"
  add_foreign_key "days", "users"
  add_foreign_key "days", "weeks"
  add_foreign_key "dinners", "foodtypes"
  add_foreign_key "friends", "users", column: "friend1_user_id"
  add_foreign_key "friends", "users", column: "friend2_user_id"
  add_foreign_key "lunches", "foodtypes"
  add_foreign_key "objectives", "users"
end
