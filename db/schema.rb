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

ActiveRecord::Schema.define(version: 2019_09_24_062853) do

  create_table "api_credentials", force: :cascade do |t|
    t.string "api_name"
    t.string "api_id"
    t.string "api_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "api_results", force: :cascade do |t|
    t.string "item_type"
    t.integer "result_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "computers", force: :cascade do |t|
    t.string "connecter_guid"
    t.string "hostname"
    t.boolean "active"
    t.string "connector_version"
    t.string "operating_system"
    t.string "external_ip"
    t.string "group_guid"
    t.datetime "install_date"
    t.datetime "last_seen"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "links", force: :cascade do |t|
    t.integer "computers_id"
    t.string "computer"
    t.string "trajectory"
    t.string "group"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["computers_id"], name: "index_links_on_computers_id"
  end

  create_table "policies", force: :cascade do |t|
    t.integer "computers_id"
    t.string "guid"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["computers_id"], name: "index_policies_on_computers_id"
  end

end
