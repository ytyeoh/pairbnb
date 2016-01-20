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

ActiveRecord::Schema.define(version: 20160119052401) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "listings", force: :cascade do |t|
    t.string   "title"
    t.text     "desc"
    t.string   "tag"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "room_type"
    t.integer  "accommodates"
    t.string   "location"
    t.integer  "price"
    t.json     "avatars"
  end

  create_table "purchases", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "reservation_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.boolean  "paid"
  end

  add_index "purchases", ["user_id", "reservation_id"], name: "index_purchases_on_user_id_and_reservation_id", unique: true, using: :btree

  create_table "reservations", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "check_in"
    t.date     "check_out"
    t.integer  "guests"
    t.integer  "listing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "total"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "listing_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "taggings", ["listing_id"], name: "index_taggings_on_listing_id", using: :btree
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "encrypted_password",    limit: 128
    t.string   "confirmation_token",    limit: 128
    t.string   "remember_token",        limit: 128
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.string   "avatar"
    t.string   "image"
    t.integer  "braintree_customer_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  add_foreign_key "taggings", "listings"
  add_foreign_key "taggings", "tags"
end
