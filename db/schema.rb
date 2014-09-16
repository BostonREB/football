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

ActiveRecord::Schema.define(version: 20140912162407) do

  create_table "players", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "fullname"
    t.string   "team"
    t.integer  "pro_team_id", default: 0
    t.string   "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "active"
  end

  add_index "players", ["pro_team_id"], name: "index_players_on_pro_team_id"

  create_table "pro_teams", force: true do |t|
    t.string   "code"
    t.string   "full_name"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "conference"
    t.string   "division"
  end

  create_table "projections", force: true do |t|
    t.integer  "player_id"
    t.integer  "week"
    t.integer  "pass_att"
    t.integer  "pass_comp"
    t.integer  "pass_yds"
    t.integer  "pass_td"
    t.integer  "pass_int"
    t.integer  "rush_att"
    t.integer  "rush_yds"
    t.integer  "rush_td"
    t.integer  "fumbles_lost"
    t.integer  "receptions"
    t.integer  "rec_yds"
    t.integer  "rec_td"
    t.integer  "fg"
    t.integer  "xp"
    t.integer  "def_int"
    t.integer  "def_fum_recovery"
    t.integer  "def_sack"
    t.integer  "def_td"
    t.integer  "def_return_td"
    t.integer  "def_safety"
    t.integer  "def_points_allowed"
    t.integer  "def_yds_allowed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projections", ["player_id"], name: "index_projections_on_player_id"

  create_table "team_player_relationships", force: true do |t|
    t.integer  "selecting_team_id"
    t.integer  "selected_player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "team_player_relationships", ["selected_player_id"], name: "index_team_player_relationships_on_selected_player_id"
  add_index "team_player_relationships", ["selecting_team_id"], name: "index_team_player_relationships_on_selecting_team_id"

  create_table "teams", force: true do |t|
    t.string  "name"
    t.integer "user_id"
  end

  add_index "teams", ["user_id"], name: "index_teams_on_user_id"

  create_table "users", force: true do |t|
    t.string   "username",        null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
