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

ActiveRecord::Schema[7.0].define(version: 2023_06_12_321908) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "additional_service_area_codes", force: :cascade do |t|
    t.text "SACode", default: [], array: true
  end

  create_table "excavators", force: :cascade do |t|
    t.text "companyName"
    t.text "address"
    t.boolean "crewOnsite"
  end

  create_table "primary_service_area_codes", force: :cascade do |t|
    t.text "SACode"
  end

  create_table "service_areas", force: :cascade do |t|
    t.text "requestNumber"
    t.bigint "primary_service_area_codes_id"
    t.bigint "additional_service_area_codes_id"
    t.index ["additional_service_area_codes_id"], name: "index_service_areas_on_additional_service_area_codes_id"
    t.index ["primary_service_area_codes_id"], name: "index_service_areas_on_primary_service_area_codes_id"
  end

  create_table "ticket_dates", force: :cascade do |t|
    t.datetime "requestTakenDateTime", null: false
    t.datetime "transmissionDateTime", null: false
    t.datetime "legalDateTime", null: false
    t.datetime "responseDueDateTime", null: false
    t.datetime "restakeDate", null: false
    t.datetime "expirationDate", null: false
    t.datetime "lpmMettingAcceptDueDate", null: false
    t.datetime "overheadBeginDate", null: false
    t.datetime "overheadEndDate", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.text "requestNumber"
    t.integer "versionNumber"
    t.integer "sequenceNumber"
    t.text "requestType"
    t.text "requestAction"
    t.bigint "service_areas_id"
    t.bigint "ticket_dates_id"
    t.index ["service_areas_id"], name: "index_tickets_on_service_areas_id"
    t.index ["ticket_dates_id"], name: "index_tickets_on_ticket_dates_id"
  end

  add_foreign_key "service_areas", "additional_service_area_codes", column: "additional_service_area_codes_id"
  add_foreign_key "service_areas", "primary_service_area_codes", column: "primary_service_area_codes_id"
  add_foreign_key "tickets", "service_areas", column: "service_areas_id"
  add_foreign_key "tickets", "ticket_dates", column: "ticket_dates_id"
end
