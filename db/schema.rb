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

ActiveRecord::Schema.define(version: 20150527015503) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "slug"
  end

  add_index "categories", ["slug"], name: "index_categories_on_slug", using: :btree

  create_table "order_photos", force: :cascade do |t|
    t.integer  "photo_id"
    t.integer  "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "order_photos", ["order_id"], name: "index_order_photos_on_order_id", using: :btree
  add_index "order_photos", ["photo_id"], name: "index_order_photos_on_photo_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "subtotal"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "status",     default: 0
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "photo_categories", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "photo_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "photo_categories", ["category_id"], name: "index_photo_categories_on_category_id", using: :btree
  add_index "photo_categories", ["photo_id"], name: "index_photo_categories_on_photo_id", using: :btree

  create_table "photos", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "price"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "store_id"
  end

  add_index "photos", ["store_id"], name: "index_photos_on_store_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "store_orders", force: :cascade do |t|
    t.integer "store_id"
    t.integer "order_id"
  end

  add_index "store_orders", ["order_id"], name: "index_store_orders_on_order_id", using: :btree
  add_index "store_orders", ["store_id"], name: "index_store_orders_on_store_id", using: :btree

  create_table "stores", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "description"
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_roles", ["role_id"], name: "index_user_roles_on_role_id", using: :btree
  add_index "user_roles", ["user_id"], name: "index_user_roles_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "store_id"
  end

  add_index "users", ["store_id"], name: "index_users_on_store_id", using: :btree

  add_foreign_key "order_photos", "orders"
  add_foreign_key "order_photos", "photos"
  add_foreign_key "orders", "users"
  add_foreign_key "photo_categories", "categories"
  add_foreign_key "photo_categories", "photos"
  add_foreign_key "store_orders", "orders"
  add_foreign_key "store_orders", "stores"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
  add_foreign_key "users", "stores"
end
