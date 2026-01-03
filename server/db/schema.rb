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

ActiveRecord::Schema[8.0].define(version: 2026_01_03_030832) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "products", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "seller_id", null: false
    t.string "title", null: false
    t.text "description"
    t.decimal "price", precision: 10, scale: 2, null: false
    t.boolean "is_active", default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_products_on_deleted_at"
    t.index ["seller_id", "is_active"], name: "index_products_on_seller_id_and_is_active"
    t.index ["seller_id"], name: "index_products_on_seller_id"
  end

  create_table "sellers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "phone", null: false
    t.string "business_name"
    t.string "document"
    t.boolean "is_active", default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password"
    t.index ["deleted_at"], name: "index_sellers_on_deleted_at"
    t.index ["document"], name: "index_sellers_on_document", unique: true
    t.index ["email"], name: "index_sellers_on_email", unique: true
  end

  add_foreign_key "products", "sellers"
end
