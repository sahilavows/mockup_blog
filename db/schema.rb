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

ActiveRecord::Schema[7.0].define(version: 2023_08_20_113819) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "registrations", force: :cascade do |t|
    t.boolean "medical_examination"
    t.boolean "certification"
    t.boolean "result_released"
    t.boolean "xray_film_pending_review"
    t.boolean "xray_film_recived_by_xqcc"
    t.boolean "xray_film_reviwed"
    t.boolean "result_transmitted_to_immigration"
    t.boolean "block_fw"
    t.boolean "appeal"
    t.string "Time_period"
    t.string "sector"
    t.string "state"
    t.string "country"
    t.string "age"
    t.string "gender"
    t.string "registration_at"
    t.string "foregin_worker_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.integer "user_id"
    t.boolean "passed"
    t.string "doctor_name"
    t.string "visa_type"
    t.boolean "purchased_insurence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "state_data", force: :cascade do |t|
    t.integer "state_name_id"
    t.integer "doctors_no"
    t.integer "x_ray_count"
    t.integer "lab_count"
    t.integer "employer_count"
    t.integer "fw_count"
    t.integer "desease_detected_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "state_names", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "state"
    t.string "city"
    t.string "country"
    t.integer "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
