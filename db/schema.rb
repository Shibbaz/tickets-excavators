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

ActiveRecord::Schema[7.0].define(version: 2023_06_23_321623) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "additional_service_area_codes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "sa_code", default: [], array: true
  end

  create_table "adress_digsites", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "adress_num", default: [], array: true
  end

  create_table "adress_infos", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "state"
    t.text "county"
    t.text "place"
    t.text "zip"
    t.uuid "adress_digsite_id", null: false
    t.uuid "street_digsite_id", null: false
    t.index ["adress_digsite_id"], name: "index_adress_infos_on_adress_digsite_id"
    t.index ["street_digsite_id"], name: "index_adress_infos_on_street_digsite_id"
  end

  create_table "contacts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.integer "phone"
    t.string "email"
  end

  create_table "digsite_infos", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "look_up_by"
    t.text "location_type"
    t.text "subdivision"
    t.uuid "adress_info_id", null: false
    t.uuid "near_streets_id", null: false
    t.uuid "intersections_id", null: false
    t.geography "polygon", limit: {:srid=>4326, :type=>"st_polygon", :geographic=>true}
    t.index ["adress_info_id"], name: "index_digsite_infos_on_adress_info_id"
    t.index ["intersections_id"], name: "index_digsite_infos_on_intersections_id"
    t.index ["near_streets_id"], name: "index_digsite_infos_on_near_streets_id"
  end

  create_table "excavation_infos", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "type_of_work"
    t.text "work_done_for"
    t.datetime "project_start_date", null: false
    t.text "project_duration"
    t.text "explosives"
    t.text "under_ground_over_head"
    t.text "horizontal_boring"
    t.text "white_lined"
    t.text "locate_instructions"
    t.text "remarks"
    t.uuid "digsite_infos_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["digsite_infos_id"], name: "index_excavation_infos_on_digsite_infos_id"
  end

  create_table "excavators", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "company_name"
    t.text "address"
    t.text "city"
    t.text "state"
    t.text "zip"
    t.boolean "crew_on_site"
    t.string "type"
    t.uuid "field_contacts_id"
    t.uuid "contacts_id"
    t.index ["contacts_id"], name: "index_excavators_on_contacts_id"
    t.index ["field_contacts_id"], name: "index_excavators_on_field_contacts_id"
  end

  create_table "field_contacts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.integer "phone"
    t.string "email"
  end

  create_table "intersections", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "itoi_ids", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "itois", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "state"
    t.text "county"
    t.text "place"
    t.text "prefix"
    t.text "name"
    t.text "dig_type"
    t.text "suffix"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "near_streets", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "state"
    t.text "county"
    t.text "place"
    t.text "prefix"
    t.text "name"
    t.text "dig_type"
    t.text "suffix"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "primary_service_area_codes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "sa_code"
  end

  create_table "service_areas", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "requestNumber"
    t.uuid "primary_service_area_codes_id"
    t.uuid "additional_service_area_codes_id"
    t.index ["additional_service_area_codes_id"], name: "index_service_areas_on_additional_service_area_codes_id"
    t.index ["primary_service_area_codes_id"], name: "index_service_areas_on_primary_service_area_codes_id"
  end

  create_table "street_digsites", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "prefix"
    t.text "name"
    t.text "dig_type"
    t.text "suffix"
  end

  create_table "ticket_dates", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "request_taken_date_time", null: false
    t.datetime "transmission_date_time", null: false
    t.datetime "legal_date_time", null: false
    t.datetime "response_due_date_time", null: false
    t.datetime "restake_date", null: false
    t.datetime "expiration_date", null: false
    t.datetime "lpm_metting_accept_due_date", null: false
    t.datetime "overhead_begin_date", null: false
    t.datetime "overhead_end_date", null: false
  end

  create_table "tickets", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "contact_center"
    t.text "request_number"
    t.integer "version_number"
    t.integer "sequence_number"
    t.text "request_type"
    t.text "request_action"
    t.uuid "service_areas_id"
    t.uuid "ticket_dates_id"
    t.uuid "excavator_id"
    t.uuid "excavation_info_id"
    t.index ["excavation_info_id"], name: "index_tickets_on_excavation_info_id"
    t.index ["excavator_id"], name: "index_tickets_on_excavator_id"
    t.index ["service_areas_id"], name: "index_tickets_on_service_areas_id"
    t.index ["ticket_dates_id"], name: "index_tickets_on_ticket_dates_id"
  end

  add_foreign_key "adress_infos", "adress_digsites"
  add_foreign_key "adress_infos", "street_digsites"
  add_foreign_key "digsite_infos", "adress_infos"
  add_foreign_key "digsite_infos", "intersections", column: "intersections_id"
  add_foreign_key "digsite_infos", "near_streets", column: "near_streets_id"
  add_foreign_key "excavation_infos", "digsite_infos", column: "digsite_infos_id"
  add_foreign_key "excavators", "contacts", column: "contacts_id"
  add_foreign_key "excavators", "field_contacts", column: "field_contacts_id"
  add_foreign_key "service_areas", "additional_service_area_codes", column: "additional_service_area_codes_id"
  add_foreign_key "service_areas", "primary_service_area_codes", column: "primary_service_area_codes_id"
  add_foreign_key "tickets", "excavation_infos"
  add_foreign_key "tickets", "excavators"
  add_foreign_key "tickets", "service_areas", column: "service_areas_id"
  add_foreign_key "tickets", "ticket_dates", column: "ticket_dates_id"
end
