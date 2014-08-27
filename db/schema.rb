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

ActiveRecord::Schema.define(version: 20140825183918) do

  create_table "players", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "fullname"
    t.string   "team"
    t.integer  "pro_team_id", default: 0
    t.string   "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "players", ["pro_team_id"], name: "index_players_on_pro_team_id"

  create_table "pro_teams", force: true do |t|
    t.string   "code"
    t.string   "full_name"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
