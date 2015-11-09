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

ActiveRecord::Schema.define(version: 20151109163502) do

  create_table "enju_root_content_types", force: :cascade do |t|
    t.string   "name"
    t.text     "display_name"
    t.text     "note"
    t.integer  "position"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "enju_root_embodies", force: :cascade do |t|
    t.integer  "expression_id"
    t.integer  "manifestation_id"
    t.integer  "embody_type_id"
    t.text     "note"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "enju_root_embodies", ["expression_id"], name: "index_enju_root_embodies_on_expression_id"
  add_index "enju_root_embodies", ["manifestation_id"], name: "index_enju_root_embodies_on_manifestation_id"

  create_table "enju_root_embody_types", force: :cascade do |t|
    t.string   "name"
    t.text     "display_name"
    t.text     "note"
    t.integer  "position"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "enju_root_expressions", force: :cascade do |t|
    t.integer  "work_id"
    t.integer  "language_id"
    t.integer  "content_type_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "expression_graph_id"
    t.string   "expression_graph_filename"
    t.integer  "expression_graph_size"
    t.string   "expression_graph_content_type"
  end

  add_index "enju_root_expressions", ["work_id"], name: "index_enju_root_expressions_on_work_id"

  create_table "enju_root_form_of_works", force: :cascade do |t|
    t.string   "name"
    t.text     "display_name"
    t.text     "note"
    t.integer  "position"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "enju_root_languages", force: :cascade do |t|
    t.string   "name"
    t.text     "display_name"
    t.text     "note"
    t.integer  "position"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "enju_root_manifestations", force: :cascade do |t|
    t.string   "manifestation_url"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "enju_root_manifestations", ["manifestation_url"], name: "index_enju_root_manifestations_on_manifestation_url"

  create_table "enju_root_nomens", force: :cascade do |t|
    t.string   "name"
    t.string   "scheme"
    t.integer  "dimension"
    t.integer  "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enju_root_thema_and_nomens", force: :cascade do |t|
    t.integer  "thema_id"
    t.integer  "nomen_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "enju_root_thema_and_nomens", ["nomen_id"], name: "index_enju_root_thema_and_nomens_on_nomen_id"
  add_index "enju_root_thema_and_nomens", ["thema_id"], name: "index_enju_root_thema_and_nomens_on_thema_id"

  create_table "enju_root_themas", force: :cascade do |t|
    t.string   "node"
    t.integer  "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "enju_root_themas", ["parent_id"], name: "index_enju_root_themas_on_parent_id"

  create_table "enju_root_work_and_subjects", force: :cascade do |t|
    t.string   "source_url"
    t.string   "destination_url"
    t.integer  "relationship_type_id"
    t.text     "note"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "enju_root_work_and_subjects", ["destination_url"], name: "index_enju_root_work_and_subjects_on_destination_url"
  add_index "enju_root_work_and_subjects", ["relationship_type_id"], name: "index_enju_root_work_and_subjects_on_relationship_type_id"
  add_index "enju_root_work_and_subjects", ["source_url"], name: "index_enju_root_work_and_subjects_on_source_url"

  create_table "enju_root_work_relationship_types", force: :cascade do |t|
    t.string   "name"
    t.text     "display_name"
    t.text     "note"
    t.integer  "position"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "enju_root_work_relationships", force: :cascade do |t|
    t.integer  "parent_id"
    t.integer  "child_id"
    t.integer  "work_relationship_type_id"
    t.text     "note"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "enju_root_work_relationships", ["child_id"], name: "index_enju_root_work_relationships_on_child_id"
  add_index "enju_root_work_relationships", ["parent_id"], name: "index_enju_root_work_relationships_on_parent_id"

  create_table "enju_root_works", force: :cascade do |t|
    t.text     "preferred_title"
    t.integer  "form_of_work_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "work_graph_id"
    t.string   "work_graph_filename"
    t.integer  "work_graph_size"
    t.string   "work_graph_content_type"
  end

end
