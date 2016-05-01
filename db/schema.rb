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

ActiveRecord::Schema.define(version: 20160501215142) do

  create_table "addresses", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "product_id", limit: 255
    t.integer  "number",     limit: 4,   default: 1
    t.boolean  "is_bought",  limit: 1,   default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.integer  "strong_point", limit: 4
    t.string   "link",         limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "category_nds", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "category_id", limit: 4
    t.string   "link",        limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "category_products", force: :cascade do |t|
    t.integer  "category_id", limit: 4
    t.integer  "product_id",  limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.integer  "telephone_id", limit: 4
    t.integer  "address_id",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "contacts", ["address_id"], name: "index_contacts_on_address_id", using: :btree
  add_index "contacts", ["telephone_id"], name: "index_contacts_on_telephone_id", using: :btree

  create_table "districts", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "provincial_id", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "file_attackts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "src",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "ms",            limit: 4
    t.string   "name",          limit: 255
    t.string   "street",        limit: 255
    t.integer  "provincial_id", limit: 4
    t.integer  "district_id",   limit: 4
    t.string   "phone",         limit: 255
    t.integer  "product_id",    limit: 4
    t.integer  "number",        limit: 4
    t.string   "size",          limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "ms",             limit: 255
    t.string   "name",           limit: 255
    t.string   "description",    limit: 255
    t.string   "size",           limit: 255
    t.string   "material",       limit: 255
    t.string   "picture",        limit: 255
    t.integer  "price",          limit: 4
    t.integer  "sale",           limit: 4
    t.integer  "number",         limit: 4
    t.integer  "category_nd_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "provincials", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "slides", force: :cascade do |t|
    t.string   "picture",      limit: 255
    t.string   "description",  limit: 255
    t.integer  "strong_point", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "telephones", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "number",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "uis", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.integer  "file_attackt_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "uis", ["file_attackt_id"], name: "index_uis_on_file_attackt_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "avatar",                 limit: 255
    t.string   "name",                   limit: 255
    t.integer  "sex",                    limit: 4
    t.string   "link",                   limit: 255
    t.string   "street",                 limit: 255
    t.integer  "provincial_id",          limit: 4
    t.integer  "district_id",            limit: 4
    t.integer  "phone",                  limit: 4
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "auth_token",             limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "contacts", "addresses"
  add_foreign_key "contacts", "telephones"
  add_foreign_key "uis", "file_attackts"
end
