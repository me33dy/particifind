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

ActiveRecord::Schema.define(version: 20140916030901) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "posts", force: true do |t|
    t.string   "title"
    t.string   "field"
    t.date     "begin_date"
    t.date     "end_date"
    t.integer  "participants_wanted"
    t.integer  "age"
    t.string   "gender"
    t.string   "description"
    t.string   "compensation"
    t.float    "time_needed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",             null: false
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "field"
    t.string   "salt"
    t.string   "hashed_password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end