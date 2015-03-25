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

ActiveRecord::Schema.define(version: 20150325115738) do

  create_table "klass_result_sets", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "klass_id"
    t.integer  "variables"
    t.integer  "public_variables"
    t.integer  "protected_variables"
    t.integer  "private_variables"
    t.integer  "number_of_lines"
    t.integer  "number_of_methods"
    t.float    "average_lines_per_method"
    t.float    "average_method_complexity"
    t.float    "weighted_methods_per_class"
    t.integer  "depth_of_inheritance"
    t.float    "LCOM"
    t.float    "CBO"
    t.integer  "result_set_group_id"
    t.boolean  "is_total"
  end

  create_table "klasses", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "package"
    t.integer  "project_id"
  end

  create_table "method_result_sets", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "methood_id"
    t.integer  "number_of_lines"
    t.integer  "complexity"
    t.integer  "result_set_group_id"
  end

  create_table "methoods", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "return_type"
    t.integer  "klass_id"
  end

  create_table "projects", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "name"
    t.string   "guid"
  end

  create_table "result_set_groups", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "upload_guid"
  end

  create_table "tasks", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "description"
    t.boolean  "complete"
    t.integer  "project_id"
    t.date     "due_date"
  end

  create_table "users", force: true do |t|
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
