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

ActiveRecord::Schema[7.0].define(version: 2023_01_27_064635) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "email", null: false
    t.string "number"
    t.text "address"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "order_id"
    t.integer "product_id"
    t.datetime "order_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.integer "order_id"
    t.integer "customer_id"
    t.decimal "amount", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "product_name"
    t.text "product_description"
    t.integer "product_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "product_color"
    t.string "product_size"
    t.bigint "parent_id"
    t.index ["parent_id"], name: "index_products_on_parent_id"
  end

  create_table "products_options", force: :cascade do |t|
    t.string "key"
    t.string "value"
    t.bigint "product_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_products_options_on_category_id"
    t.index ["product_id"], name: "index_products_options_on_product_id"
  end

  add_foreign_key "products", "products", column: "parent_id"
  add_foreign_key "products_options", "categories"
  add_foreign_key "products_options", "products"
end
