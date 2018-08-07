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

ActiveRecord::Schema.define(version: 2018_08_07_194033) do

  create_table "coin_checks", force: :cascade do |t|
    t.string "md5"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["md5"], name: "index_coin_checks_on_md5", unique: true
  end

  create_table "coins", force: :cascade do |t|
    t.string "root_uuid", null: false
    t.string "uuid", null: false
    t.string "md5", null: false
    t.boolean "spent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["md5"], name: "index_coins_on_md5", unique: true
    t.index ["uuid"], name: "index_coins_on_uuid", unique: true
  end

end
