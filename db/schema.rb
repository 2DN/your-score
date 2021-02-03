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

ActiveRecord::Schema.define(version: 2021_02_03_053713) do

  create_table "averages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "avg_title", null: false
    t.integer "avg_jpn_ctp"
    t.integer "avg_jpn_classic"
    t.integer "avg_jpn_chinese"
    t.integer "avg_jpn"
    t.integer "avg_math_1_a"
    t.integer "avg_math_2_b"
    t.integer "avg_math_3_c"
    t.integer "avg_math_1"
    t.integer "avg_math_2"
    t.integer "avg_math_3"
    t.integer "avg_math_a"
    t.integer "avg_math_b"
    t.integer "avg_math_c"
    t.integer "avg_math"
    t.integer "avg_book_keep"
    t.integer "avg_basic_info"
    t.integer "avg_science_n_life"
    t.integer "avg_basic_physics"
    t.integer "avg_physics"
    t.integer "avg_basic_chemistry"
    t.integer "avg_chemistry"
    t.integer "avg_basic_earth_science"
    t.integer "avg_earth_science"
    t.integer "avg_basic_biology"
    t.integer "avg_biology"
    t.integer "avg_science"
    t.integer "avg_wld_history_a"
    t.integer "avg_wld_history_b"
    t.integer "avg_dms_history_a"
    t.integer "avg_dms_history_b"
    t.integer "avg_geography_a"
    t.integer "avg_geography_b"
    t.integer "avg_ctp_society"
    t.integer "avg_ethics"
    t.integer "avg_politics_n_economy"
    t.integer "avg_ethics_n_politics_n_economy"
    t.integer "avg_society"
    t.integer "avg_listening"
    t.integer "avg_reading"
    t.integer "avg_english"
    t.integer "avg_language"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "subjects", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "sub_title", null: false
    t.string "sub_jpn_ctp"
    t.string "sub_jpn_classic"
    t.string "sub_jpn_chinese"
    t.string "sub_jpn"
    t.string "sub_math_1_a"
    t.string "sub_math_2_b"
    t.string "sub_math_3_c"
    t.string "sub_math_1"
    t.string "sub_math_2"
    t.string "sub_math_3"
    t.string "sub_math_a"
    t.string "sub_math_b"
    t.string "sub_math_c"
    t.string "sub_math"
    t.string "sub_book_keep"
    t.string "sub_basic_info"
    t.string "sub_science_n_life"
    t.string "sub_basic_physics"
    t.string "sub_physics"
    t.string "sub_basic_chemistry"
    t.string "sub_chemistry"
    t.string "sub_basic_earth_science"
    t.string "sub_earth_science"
    t.string "sub_basic_biology"
    t.string "sub_biology"
    t.string "sub_science"
    t.string "sub_wld_history_a"
    t.string "sub_wld_history_b"
    t.string "sub_dms_history_a"
    t.string "sub_dms_history_b"
    t.string "sub_geography_a"
    t.string "sub_geography_b"
    t.string "sub_ctp_society"
    t.string "sub_ethics"
    t.string "sub_politics_n_economy"
    t.string "sub_ethics_n_politics_n_economy"
    t.string "sub_society"
    t.string "sub_listening"
    t.string "sub_reading"
    t.string "sub_english"
    t.string "sub_language"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tasks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "task_title", null: false
    t.string "memo"
    t.date "limit_date", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "username", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "tasks", "users"
end
