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

ActiveRecord::Schema.define(version: 20160328084238) do

  create_table "authors", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "term",       limit: 255
    t.string   "label",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entries", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "guid",       limit: 255
    t.string   "summary",    limit: 255
    t.text     "content",    limit: 65535
    t.integer  "feed_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "entries", ["feed_id"], name: "index_entries_on_feed_id", using: :btree

  create_table "entry_authors", force: :cascade do |t|
    t.integer  "entry_id",   limit: 4
    t.integer  "author_id",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "entry_authors", ["author_id"], name: "index_entry_authors_on_author_id", using: :btree
  add_index "entry_authors", ["entry_id"], name: "index_entry_authors_on_entry_id", using: :btree

  create_table "entry_categories", force: :cascade do |t|
    t.integer  "entry_id",    limit: 4
    t.integer  "category_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "entry_categories", ["category_id"], name: "index_entry_categories_on_category_id", using: :btree
  add_index "entry_categories", ["entry_id"], name: "index_entry_categories_on_entry_id", using: :btree

  create_table "entry_links", force: :cascade do |t|
    t.integer  "entry_id",   limit: 4
    t.integer  "link_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "entry_links", ["entry_id"], name: "index_entry_links_on_entry_id", using: :btree
  add_index "entry_links", ["link_id"], name: "index_entry_links_on_link_id", using: :btree

  create_table "feeds", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "guid",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "links", force: :cascade do |t|
    t.string   "rel",        limit: 255
    t.string   "type",       limit: 255
    t.integer  "length",     limit: 4
    t.string   "href",       limit: 255
    t.string   "title",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
