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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130203172007) do

  create_table "boards", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "additional_email_receiver"
  end

  create_table "memberships", :force => true do |t|
    t.datetime "from"
    t.datetime "to"
    t.integer  "board_id"
    t.integer  "person_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "memberships", ["board_id"], :name => "index_memberships_on_board_id"
  add_index "memberships", ["person_id"], :name => "index_memberships_on_person_id"

  create_table "people", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
  end

  create_table "resolutions", :force => true do |t|
    t.string   "title"
    t.text     "resolution_text"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "board_id"
    t.string   "reasons"
    t.string   "requestor"
    t.string   "message_id"
  end

  create_table "votes", :force => true do |t|
    t.string   "voting"
    t.string   "invite_code"
    t.integer  "resolution_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "membership_id"
  end

  add_index "votes", ["resolution_id"], :name => "index_votes_on_resolution_id"

end
