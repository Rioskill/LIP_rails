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

ActiveRecord::Schema[7.0].define(version: 2022_12_19_201246) do
  create_table "simon_intervals", force: :cascade do |t|
    t.integer "start"
    t.integer "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "simon_intervals_results", id: false, force: :cascade do |t|
    t.integer "simon_result_id", null: false
    t.integer "simon_interval_id", null: false
    t.index ["simon_interval_id"], name: "index_simon_intervals_results_on_simon_interval_id"
    t.index ["simon_result_id"], name: "index_simon_intervals_results_on_simon_result_id"
  end

  create_table "simon_results", force: :cascade do |t|
    t.integer "value"
    t.integer "n_num"
    t.integer "n_fact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
