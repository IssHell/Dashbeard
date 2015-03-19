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

ActiveRecord::Schema.define(version: 20150319111410) do

  create_table "data_caches", force: :cascade do |t|
    t.string   "stock"
    t.string   "rss"
    t.string   "bus"
    t.string   "train"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "stockDate"
    t.datetime "rssDate"
    t.datetime "trainDate"
    t.datetime "busDate"
  end

  create_table "settings", force: :cascade do |t|
    t.string   "rssfeed"
    t.string   "stocksymbol"
    t.string   "weathercode"
    t.string   "trainstation"
    t.integer  "busstopcode"
    t.integer  "refreshtime"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.text     "notices"
  end

end
