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

ActiveRecord::Schema.define(version: 20140816174658) do

  create_table "forms", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "service_cost"
    t.string   "equipment_type"
    t.string   "nic_connection"
    t.string   "os_type"
    t.string   "antivir_type"
    t.string   "paynum"
    t.binary   "completed"
    t.string   "email"
    t.string   "phone_number"
    t.string   "computer_name"
    t.string   "technician_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "printer_ip"
    t.string   "office_number"
    t.datetime "complete_date"
    t.datetime "expire_date"
    t.string   "antivir_expire_date"
    t.integer  "user_id"
  end

  add_index "forms", ["user_id"], name: "index_forms_on_user_id", using: :btree

  create_table "printers", force: true do |t|
    t.string   "ip_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: ""
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "office_number"
    t.string   "role",                   default: "agent"
    t.string   "paynum"
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
