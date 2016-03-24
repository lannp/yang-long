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

ActiveRecord::Schema.define(version: 20160322154855) do

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "product_id"
    t.integer  "number",     default: 1
    t.boolean  "is_bought",  default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "strong_point"
    t.string   "link"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "category_nds", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.string   "link"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "category_products", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "product_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "districts", force: :cascade do |t|
    t.string   "name"
    t.string   "provincial_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "ms"
    t.string   "name"
    t.string   "street"
    t.integer  "provincial_id"
    t.integer  "district_id"
    t.string   "phone"
    t.integer  "product_id"
    t.integer  "number"
    t.string   "size"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "ms"
    t.string   "name"
    t.string   "description"
    t.string   "size"
    t.string   "material"
    t.string   "picture"
    t.integer  "price"
    t.integer  "sale"
    t.integer  "number"
    t.integer  "category_nd_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "provincials", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "slides", force: :cascade do |t|
    t.string   "picture"
    t.string   "description"
    t.integer  "strong_point"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "avatar"
    t.string   "name"
    t.integer  "sex"
    t.string   "link"
    t.string   "street"
    t.integer  "provincial_id"
    t.integer  "district_id"
    t.integer  "phone"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "auth_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
