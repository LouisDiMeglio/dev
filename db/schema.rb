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

ActiveRecord::Schema.define(version: 20160216205314) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string  "choice"
    t.integer "question_id"
    t.boolean "is_correct"
    t.integer "response_id"
  end

  add_index "answers", ["response_id"], name: "index_answers_on_response_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string  "content"
    t.integer "quiz_id"
    t.string  "options"
    t.string  "answer"
    t.string  "response"
    t.string  "option2"
    t.string  "option3"
    t.string  "option4"
  end

  create_table "quizzes", force: :cascade do |t|
    t.string   "title"
    t.boolean  "published"
    t.string   "posted_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "course_id"
    t.integer  "user_id"
  end

  add_index "quizzes", ["course_id"], name: "index_quizzes_on_course_id", using: :btree
  add_index "quizzes", ["user_id"], name: "index_quizzes_on_user_id", using: :btree

  create_table "responses", force: :cascade do |t|
    t.string  "choice"
    t.integer "user_id"
    t.integer "quiz_id"
    t.integer "course_id"
  end

  create_table "user_courses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_courses", ["course_id"], name: "index_user_courses_on_course_id", using: :btree
  add_index "user_courses", ["user_id"], name: "index_user_courses_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "temp_password"
    t.string   "type",            default: "Student"
    t.string   "remember_digest"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "course_id"
  end

  add_index "users", ["course_id"], name: "index_users_on_course_id", using: :btree

  add_foreign_key "answers", "responses"
  add_foreign_key "quizzes", "courses"
  add_foreign_key "quizzes", "users"
  add_foreign_key "users", "courses"
end
