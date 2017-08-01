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

ActiveRecord::Schema.define(version: 20160508010405) do

  create_table "actors", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.date     "birth_date"
    t.string   "birthplace", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "actors_movies", id: false, force: :cascade do |t|
    t.integer "actor_id", limit: 4, null: false
    t.integer "movie_id", limit: 4, null: false
  end

  create_table "bookcases", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.text     "description",   limit: 65535
    t.integer  "shelves_count", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.text     "picture_url",   limit: 65535
  end

  create_table "books", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "isbn",        limit: 255
    t.date     "published"
    t.integer  "pages_count", limit: 4
    t.integer  "bookcase_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "title",            limit: 255
    t.text     "comment",          limit: 65535
    t.integer  "commentable_id",   limit: 4
    t.string   "commentable_type", limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "comments", ["commentable_id"], name: "index_comments_on_commentable_id", using: :btree
  add_index "comments", ["commentable_type"], name: "index_comments_on_commentable_type", using: :btree

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   limit: 4,     default: 0, null: false
    t.integer  "attempts",   limit: 4,     default: 0, null: false
    t.text     "handler",    limit: 65535,             null: false
    t.text     "last_error", limit: 65535
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by",  limit: 255
    t.string   "queue",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "movies", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "storyline",   limit: 65535
    t.integer  "bookcase_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "rated",       limit: 255
    t.date     "released"
    t.string   "runtime",     limit: 255
    t.string   "genre",       limit: 255
    t.string   "director",    limit: 255
    t.string   "writer",      limit: 255
    t.string   "language",    limit: 255
    t.string   "country",     limit: 255
  end

end
