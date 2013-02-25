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

ActiveRecord::Schema.define(:version => 20130222231239) do

  create_table "attachments", :force => true do |t|
    t.string   "file"
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "conversations", :force => true do |t|
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "scope_id"
    t.string   "scope_type"
    t.string   "topic"
    t.boolean  "approved",   :default => false
  end

  create_table "crowds", :force => true do |t|
    t.string   "name"
    t.integer  "professor_id"
    t.integer  "subject_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "semester"
    t.integer  "year"
  end

  add_index "crowds", ["professor_id"], :name => "index_crowds_on_professor_id"
  add_index "crowds", ["subject_id"], :name => "index_crowds_on_subject_id"

  create_table "deliveries", :force => true do |t|
    t.integer  "message_id"
    t.integer  "user_id"
    t.boolean  "read"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "enrollments", :force => true do |t|
    t.integer  "student_id"
    t.integer  "crowd_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "enrollments", ["crowd_id"], :name => "index_enrollments_on_crowd_id"
  add_index "enrollments", ["student_id"], :name => "index_enrollments_on_student_id"

  create_table "enunciations", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "end_date"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "crowd_id"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "enunciation_id"
  end

  create_table "memberships", :force => true do |t|
    t.integer  "student_id"
    t.integer  "group_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "messages", :force => true do |t|
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.text     "body"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "participations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "conversation_id"
    t.boolean  "archived",        :default => false
    t.integer  "last_read",       :default => 0
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "solutions", :force => true do |t|
    t.integer  "group_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "subjects", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tasks", :force => true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "solution_id"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "name"
    t.string   "type"
    t.integer  "slug"
    t.string   "google_calendar_id"
    t.string   "oauth_refresh_token"
    t.string   "oauth_access_token"
    t.integer  "oauth_expires_at"
  end

end
