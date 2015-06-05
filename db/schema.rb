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

ActiveRecord::Schema.define(version: 0) do

  create_table "assignments", force: true do |t|
    t.string  "name"
    t.integer "teacher_id"
    t.integer "num_assignments"
    t.string  "due_date"
    t.integer "estimate_time"
    t.integer "assistant_id"
    t.string  "status"
  end

  add_index "assignments", ["assistant_id"], name: "index_assignments_on_assistant_id"
  add_index "assignments", ["teacher_id"], name: "index_assignments_on_teacher_id"

  create_table "assistants", force: true do |t|
    t.string "name"
    t.string "subject_pref"
    t.string "grade_pref"
  end

  create_table "reviews", force: true do |t|
    t.integer "assistant_id"
    t.string  "date"
    t.integer "stars"
    t.text    "review"
  end

  add_index "reviews", ["assistant_id"], name: "index_reviews_on_assistant_id"

  create_table "schools", force: true do |t|
    t.string "name"
  end

  create_table "teachers", force: true do |t|
    t.string  "name"
    t.string  "subject"
    t.string  "grade"
    t.integer "school_id"
  end

  add_index "teachers", ["school_id"], name: "index_teachers_on_school_id"

  create_table "users", force: true do |t|
    t.string  "name"
    t.string  "email"
    t.integer "teacher_id"
    t.integer "assistant_id"
    t.string  "password_digest"
  end

  add_index "users", ["assistant_id"], name: "index_users_on_assistant_id"
  add_index "users", ["teacher_id"], name: "index_users_on_teacher_id"

end
