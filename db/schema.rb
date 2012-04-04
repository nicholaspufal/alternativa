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

ActiveRecord::Schema.define(:version => 20120402114404) do

  create_table "answers", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "question_id"
    t.boolean  "correct",     :default => false
  end

  create_table "exams", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exams_groups", :force => true do |t|
    t.integer "exam_id"
    t.integer "group_id"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "groups_students", :force => true do |t|
    t.integer "group_id"
    t.integer "student_id"
  end

  create_table "questions", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "exam_id"
    t.decimal  "weight"
  end

  create_table "results", :force => true do |t|
    t.decimal  "grade"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "exam_id"
    t.integer  "student_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "type"
  end

end
