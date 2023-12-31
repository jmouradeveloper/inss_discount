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

ActiveRecord::Schema[7.0].define(version: 2023_10_28_014400) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street_name", limit: 64, null: false
    t.integer "number", null: false
    t.string "neighborhood", limit: 64, null: false
    t.string "city", limit: 64, null: false
    t.string "state", limit: 64, null: false
    t.bigint "proponent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proponent_id"], name: "index_addresses_on_proponent_id"
  end

  create_table "contact_phones", force: :cascade do |t|
    t.string "number", null: false
    t.string "contact_type", null: false
    t.bigint "proponent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proponent_id"], name: "index_contact_phones_on_proponent_id"
  end

  create_table "proponents", force: :cascade do |t|
    t.string "name", limit: 64, null: false
    t.string "cpf", limit: 14, null: false
    t.datetime "birthdate", null: false
    t.decimal "wage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
