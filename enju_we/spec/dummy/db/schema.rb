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

ActiveRecord::Schema.define(version: 20141002110831) do

  create_table "agents", force: true do |t|
    t.text     "full_name"
    t.integer  "agent_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "date_of_bitrh"
    t.datetime "date_of_death"
    t.text     "period_of_activity"
    t.text     "title"
    t.integer  "gender_id"
    t.string   "place_of_birth"
    t.string   "place_of_death"
    t.integer  "country_id"
    t.string   "place_of_residence"
    t.string   "affiliation"
    t.text     "address"
    t.text     "field_of_activity"
    t.string   "profession"
    t.text     "history"
    t.text     "other_information_elements"
    t.string   "url"
  end

  add_index "agents", ["url"], name: "index_agents_on_url"

  create_table "carrier_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "catalogs", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "content_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "controlled_access_points", force: true do |t|
    t.string   "type_of_controlled_access_point"
    t.text     "status"
    t.text     "designated_usage"
    t.text     "undifferentiated_access_point"
    t.integer  "base_access_point_language_id"
    t.integer  "cataloging_language_id"
    t.text     "script_of_base_access_point"
    t.text     "script_of_cataloging"
    t.text     "transliteratrion_scheme_of_base_access_point"
    t.text     "transliteration_scheme_of_cataloging"
    t.text     "source"
    t.integer  "base_access_point_id"
    t.text     "addition"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "creates", force: true do |t|
    t.integer  "work_id"
    t.integer  "agent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "creates", ["agent_id"], name: "index_creates_on_agent_id"
  add_index "creates", ["work_id"], name: "index_creates_on_work_id"

  create_table "embodies", force: true do |t|
    t.integer  "expression_id"
    t.integer  "manifestation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "relationship"
    t.integer  "relationship_type_id"
  end

  add_index "embodies", ["expression_id"], name: "index_embodies_on_expression_id"
  add_index "embodies", ["manifestation_id"], name: "index_embodies_on_manifestation_id"

  create_table "exemplifies", force: true do |t|
    t.integer  "manifestation_id"
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "exemplifies", ["item_id"], name: "index_exemplifies_on_item_id"
  add_index "exemplifies", ["manifestation_id"], name: "index_exemplifies_on_manifestation_id"

  create_table "expression_relationship_types", force: true do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "definition"
    t.string   "url"
  end

  create_table "expression_relationships", force: true do |t|
    t.integer  "parent_id"
    t.integer  "child_id"
    t.integer  "expression_relationship_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "expressions", force: true do |t|
    t.text     "preferred_title"
    t.integer  "content_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "note"
    t.string   "language"
    t.datetime "date_of_expression"
    t.text     "other_distinguishing_characteristic"
    t.string   "horizontal_scale_of_cartographic_content"
    t.string   "vertical_scale_of_cartographic_content"
    t.text     "authorized_access_point"
    t.text     "variant_access_point"
    t.string   "status_of_identification"
    t.text     "source_consulted"
    t.text     "cataloguers_note"
  end

  add_index "expressions", ["content_type_id"], name: "index_expressions_on_content_type_id"

  create_table "families", force: true do |t|
    t.integer  "name_id"
    t.integer  "identifier_id"
    t.text     "type_of_family"
    t.text     "dates"
    t.text     "places_associated"
    t.text     "field_of_activity"
    t.text     "history"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "identifiers", force: true do |t|
    t.string   "type_of_identifier"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.string   "item_identifier"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "languages", force: true do |t|
    t.string   "name",         null: false
    t.string   "native_name"
    t.text     "display_name"
    t.string   "iso_639_1"
    t.string   "iso_639_2"
    t.string   "iso_639_3"
    t.text     "note"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "manifestation_relationship_types", force: true do |t|
    t.string   "name"
    t.integer  "position"
    t.string   "definition"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "manifestations", force: true do |t|
    t.text     "title_proper"
    t.integer  "carrier_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "bib_id"
    t.string   "edition"
    t.integer  "source_year"
    t.integer  "start_year"
    t.integer  "end_year"
    t.integer  "examined_year"
    t.string   "textbook_code"
    t.integer  "textbook_number"
    t.string   "extent"
    t.text     "note"
    t.string   "textbook_subject"
    t.string   "course"
    t.string   "url"
  end

  add_index "manifestations", ["bib_id"], name: "index_manifestations_on_bib_id"

  create_table "names", force: true do |t|
    t.string   "type_of_name"
    t.string   "name_string"
    t.text     "scope_of_usage"
    t.text     "dates_of_usage"
    t.integer  "language_id"
    t.string   "script"
    t.string   "transliteration_scheme"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: true do |t|
    t.string   "name"
    t.integer  "work_id"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "people", ["url"], name: "index_people_on_url"
  add_index "people", ["work_id"], name: "index_people_on_work_id"

  create_table "produces", force: true do |t|
    t.integer  "manifestation_id"
    t.integer  "agent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "produces", ["agent_id"], name: "index_produces_on_agent_id"
  add_index "produces", ["manifestation_id"], name: "index_produces_on_manifestation_id"

  create_table "realizes", force: true do |t|
    t.integer  "expression_id"
    t.integer  "agent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "realizes", ["agent_id"], name: "index_realizes_on_agent_id"
  add_index "realizes", ["expression_id"], name: "index_realizes_on_expression_id"

  create_table "reifies", force: true do |t|
    t.integer  "work_id"
    t.integer  "expression_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "relationship_type_id"
  end

  add_index "reifies", ["expression_id"], name: "index_reifies_on_expression_id"
  add_index "reifies", ["work_id"], name: "index_reifies_on_work_id"

  create_table "roles", force: true do |t|
    t.string   "name",                     null: false
    t.string   "display_name"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "score",        default: 0, null: false
    t.integer  "position"
  end

  create_table "subjects", force: true do |t|
    t.string   "term"
    t.integer  "subject_heading_id"
    t.integer  "subject_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_has_roles", force: true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_has_roles", ["role_id"], name: "index_user_has_roles_on_role_id"
  add_index "user_has_roles", ["user_id"], name: "index_user_has_roles_on_user_id"

  create_table "work_relationship_types", force: true do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "definition"
    t.string   "url"
  end

  create_table "work_relationships", force: true do |t|
    t.integer  "parent_id"
    t.integer  "child_id"
    t.integer  "work_relationship_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "work_relationships", ["child_id"], name: "index_work_relationships_on_child_id"
  add_index "work_relationships", ["parent_id"], name: "index_work_relationships_on_parent_id"

  create_table "works", force: true do |t|
    t.text     "preferred_title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "form_of_work"
    t.date     "date_of_work"
    t.text     "parent_work_url"
    t.text     "variant_title"
    t.text     "intended_audience"
    t.text     "place_of_origin"
    t.text     "other_distinguishing_characteristic"
    t.string   "identifier"
    t.string   "medium_of_performance"
    t.text     "numeric_designation"
    t.text     "key"
    t.text     "signatory_for_treaty"
    t.text     "authorized_access_point"
    t.text     "variant_access_point"
    t.string   "status_of_identification"
    t.text     "source_consulted"
    t.text     "cataloguers_note"
  end

end
