# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091004145637) do

  create_table "courses", :force => true do |t|
    t.integer  "moodle_id"
    t.string   "name"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lectures", :force => true do |t|
    t.integer  "course_id"
    t.string   "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "presences", :force => true do |t|
    t.string   "login"
    t.string   "name"
    t.string   "mail"
    t.integer  "course_id"
    t.string   "ip_addr"
    t.boolean  "proxyed"
    t.integer  "lecture_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "presences", ["login", "lecture_id"], :name => "index_presences_on_login_and_lecture_id", :unique => true

  create_table "test_resources", :force => true do |t|
    t.string   "hoge"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
