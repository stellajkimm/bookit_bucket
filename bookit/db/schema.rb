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

ActiveRecord::Schema.define(version: 20140912043850) do

  create_table "attendances", force: true do |t|
    t.integer  "item_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attendances", ["item_id"], name: "index_attendances_on_item_id"
  add_index "attendances", ["user_id"], name: "index_attendances_on_user_id"

  create_table "bucket_hashtags", force: true do |t|
    t.integer  "bucket_id"
    t.integer  "hashtag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bucket_hashtags", ["bucket_id"], name: "index_bucket_hashtags_on_bucket_id"
  add_index "bucket_hashtags", ["hashtag_id"], name: "index_bucket_hashtags_on_hashtag_id"

  create_table "bucket_ownerships", force: true do |t|
    t.integer  "user_id"
    t.integer  "bucket_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bucket_ownerships", ["bucket_id"], name: "index_bucket_ownerships_on_bucket_id"
  add_index "bucket_ownerships", ["user_id"], name: "index_bucket_ownerships_on_user_id"

  create_table "buckets", force: true do |t|
    t.string   "name"
    t.string   "privacy"
    t.integer  "user_id"
    t.boolean  "archive",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "buckets", ["user_id"], name: "index_buckets_on_user_id"

  create_table "hashtags", force: true do |t|
    t.string   "tag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "status"
    t.integer  "bucket_id"
    t.string   "notes"
    t.string   "rating"
    t.string   "review"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["bucket_id"], name: "index_items_on_bucket_id"

  create_table "users", force: true do |t|
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
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "location"
    t.string   "picture"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
