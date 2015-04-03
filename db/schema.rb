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

ActiveRecord::Schema.define(version: 20150402153916) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beers", force: :cascade do |t|
    t.string  "name",        null: false
    t.float   "abv"
    t.integer "ibu"
    t.text    "description"
    t.integer "style_id",    null: false
    t.integer "user_id",     null: false
  end

  add_index "beers", ["name"], name: "index_beers_on_name", unique: true, using: :btree
  add_index "beers", ["style_id"], name: "index_beers_on_style_id", using: :btree

  create_table "downvotes", force: :cascade do |t|
    t.integer "user_id",   null: false
    t.integer "review_id", null: false
  end

  add_index "downvotes", ["user_id", "review_id"], name: "index_downvotes_on_user_id_and_review_id", unique: true, using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating",          null: false
    t.text     "description",     null: false
    t.integer  "user_id",         null: false
    t.integer  "beer_id",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "upvotes_count"
    t.integer  "downvotes_count"
  end

  add_index "reviews", ["beer_id"], name: "index_reviews_on_beer_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "styles", force: :cascade do |t|
    t.string "name", null: false
  end

  add_index "styles", ["name"], name: "index_styles_on_name", unique: true, using: :btree

  create_table "upvotes", force: :cascade do |t|
    t.integer "user_id",   null: false
    t.integer "review_id", null: false
  end

  add_index "upvotes", ["user_id", "review_id"], name: "index_upvotes_on_user_id_and_review_id", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",     null: false
    t.string   "encrypted_password",     default: "",     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",                   default: "user", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
