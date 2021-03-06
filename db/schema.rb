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

ActiveRecord::Schema.define(version: 20151022174022) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "addresses", force: :cascade do |t|
    t.string   "street"
    t.string   "unit"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "addresses", ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id", using: :btree

  create_table "businesses", force: :cascade do |t|
    t.string   "name"
    t.string   "about"
    t.string   "slug"
    t.integer  "user_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "status",     default: "online"
    t.string   "image_url"
  end

  add_index "businesses", ["user_id"], name: "index_businesses_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string "title"
  end

  create_table "items_categories", force: :cascade do |t|
    t.integer "item_id"
    t.integer "category_id"
  end

  create_table "job_applications", force: :cascade do |t|
    t.integer "user_id"
    t.integer "resume_id"
    t.integer "job_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.text     "title"
    t.text     "description"
    t.integer  "business_id"
    t.string   "status",      default: "active"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "benefits"
    t.integer  "address_id"
  end

  create_table "repositories", force: :cascade do |t|
    t.string "full_name"
    t.string "name"
  end

  create_table "resume_repositories", force: :cascade do |t|
    t.integer "resume_id"
    t.integer "repository_id"
  end

  create_table "resumes", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "cover_letter_file_name"
    t.string   "cover_letter_content_type"
    t.integer  "cover_letter_file_size"
    t.datetime "cover_letter_updated_at"
    t.string   "description"
  end

  create_table "tag_names", force: :cascade do |t|
    t.string   "name"
    t.string   "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.integer "taggable_id"
    t.string  "taggable_type"
    t.integer "tag_name_id"
  end

  add_index "tags", ["taggable_type", "taggable_id"], name: "index_tags_on_taggable_type_and_taggable_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.text    "email"
    t.text    "full_name"
    t.integer "role",      default: 0
    t.string  "provider"
    t.string  "token"
    t.string  "uid"
    t.string  "image_url"
    t.string  "nickname"
    t.string  "github"
    t.string  "location"
  end

  create_table "watched_jobs", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "watched_jobs", ["job_id"], name: "index_watched_jobs_on_job_id", using: :btree
  add_index "watched_jobs", ["user_id"], name: "index_watched_jobs_on_user_id", using: :btree

  add_foreign_key "businesses", "users"
  add_foreign_key "watched_jobs", "jobs"
  add_foreign_key "watched_jobs", "users"
end
