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

ActiveRecord::Schema.define(version: 20140710194314) do

  create_table "net_forms", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "service_cost"
    t.string   "equipment_type"
    t.string   "nic_connection"
    t.string   "os_type"
    t.string   "antivir_type"
    t.string   "paynum"
    t.date     "complete_date"
    t.binary   "completed"
    t.string   "email"
    t.string   "phone_number"
    t.string   "computer_name"
    t.date     "antivir_expire_date"
    t.string   "technician_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "printer_ip"
    t.string   "office_number"
    t.date     "expire_date"
  end

  create_table "printers", force: true do |t|
    t.string   "ip_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
