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

ActiveRecord::Schema.define(version: 20161201134214) do

  create_table "bundles", force: :cascade do |t|
    t.integer  "package_id"
    t.integer  "product_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "amount"
    t.decimal  "bundleprice", precision: 12, scale: 3
  end

  add_index "bundles", ["package_id"], name: "index_bundles_on_package_id"
  add_index "bundles", ["product_id"], name: "index_bundles_on_product_id"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "characterizations", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "package_id"
  end

  add_index "characterizations", ["category_id"], name: "index_characterizations_on_category_id"
  add_index "characterizations", ["package_id"], name: "index_characterizations_on_package_id"
  add_index "characterizations", ["product_id"], name: "index_characterizations_on_product_id"

  create_table "frequencies", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "package_id"
    t.integer  "numb"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "frequencies", ["package_id"], name: "index_frequencies_on_package_id"
  add_index "frequencies", ["product_id"], name: "index_frequencies_on_product_id"

  create_table "order_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.decimal  "unit_price",        precision: 12, scale: 3
    t.integer  "quantity"
    t.decimal  "total_price",       precision: 12, scale: 3
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "times"
    t.decimal  "undis_total_price", precision: 12, scale: 3
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id"
  add_index "order_items", ["product_id"], name: "index_order_items_on_product_id"

  create_table "order_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.decimal  "subtotal",        precision: 12, scale: 3
    t.decimal  "tax",             precision: 12, scale: 3
    t.decimal  "shipping",        precision: 12, scale: 3
    t.decimal  "total",           precision: 12, scale: 3
    t.integer  "order_status_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "user_id"
  end

  add_index "orders", ["order_status_id"], name: "index_orders_on_order_status_id"

  create_table "packages", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "often"
    t.decimal  "packageprice", precision: 12, scale: 3
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price",      precision: 12, scale: 3
    t.boolean  "active"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "value"
    t.float    "latitude"
    t.float    "longitute"
    t.string   "address"
    t.float    "longitude"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
