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

ActiveRecord::Schema.define(version: 20150304010706) do

  create_table "cards", force: :cascade do |t|
    t.string   "name"
    t.string   "attr_one"
    t.string   "attr_two"
    t.string   "attr_three"
    t.string   "attr_four"
    t.string   "attr_five"
    t.string   "attr_six"
    t.text     "attr_description"
    t.integer  "deck_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "decks", force: :cascade do |t|
    t.string   "name"
    t.text     "styling"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_decks", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "deck_id"
    t.integer  "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.string   "name"
    t.text     "card_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hands", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "card_id"
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
