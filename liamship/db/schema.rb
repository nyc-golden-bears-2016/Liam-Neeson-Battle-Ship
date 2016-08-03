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

ActiveRecord::Schema.define(version: 20160803183824) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coordinate_game_ships", force: :cascade do |t|
    t.integer  "coordinate_id", null: false
    t.integer  "game_ship_id",  null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "coordinates", force: :cascade do |t|
    t.string   "row",        null: false
    t.string   "column",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_ships", force: :cascade do |t|
    t.integer  "game_id",    null: false
    t.integer  "player_id",  null: false
    t.integer  "ship_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.integer  "player_1_id", null: false
    t.integer  "player_2_id"
    t.integer  "winner_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "ships", force: :cascade do |t|
    t.string   "type",       null: false
    t.integer  "lives",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shots", force: :cascade do |t|
    t.integer  "game_id",       null: false
    t.integer  "coordinate_id", null: false
    t.boolean  "hit?",          null: false
    t.integer  "player_id",     null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
