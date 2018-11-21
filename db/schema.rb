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

ActiveRecord::Schema.define(version: 2018_04_24_050432) do

  create_table "educations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "school"
    t.string "degree"
    t.string "major"
    t.decimal "gpa", precision: 5, scale: 2
    t.string "time"
    t.integer "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "language"
    t.boolean "status", default: true
    t.index ["user_id"], name: "index_educations_on_user_id"
  end

  create_table "experiences", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "company"
    t.string "position"
    t.text "description"
    t.integer "weight"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "time"
    t.string "language"
    t.boolean "status", default: true
    t.index ["user_id"], name: "index_experiences_on_user_id"
  end

  create_table "papers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "language"
    t.string "time"
    t.string "title"
    t.text "description"
    t.string "author_ranking"
    t.string "paper_level"
    t.integer "weight"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status", default: true
    t.index ["user_id"], name: "index_papers_on_user_id"
  end

  create_table "pdf_resumes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status", default: true
    t.string "language"
    t.index ["user_id"], name: "index_pdf_resumes_on_user_id"
  end

  create_table "projects", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "tag"
    t.string "time"
    t.text "description"
    t.integer "weight"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "language"
    t.boolean "status", default: true
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "skills", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "weight"
    t.text "description"
    t.string "language"
    t.boolean "status", default: true
    t.index ["user_id"], name: "index_skills_on_user_id"
  end

  create_table "socials", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.integer "weight"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status", default: true
    t.index ["user_id"], name: "index_socials_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "name"
    t.string "remember_digest"
    t.string "avatar"
    t.text "description"
    t.integer "template", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city"
    t.string "nickname"
    t.string "provider"
    t.string "name_en"
    t.string "city_en"
    t.string "description_en"
    t.boolean "has_social", default: true
    t.boolean "has_project", default: true
    t.boolean "has_education", default: true
    t.boolean "has_skill", default: true
    t.boolean "has_experience", default: true
    t.boolean "has_paper", default: true
    t.boolean "has_pdf_resume", default: true
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "wechats", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status", default: true
    t.index ["user_id"], name: "index_wechats_on_user_id"
  end

  add_foreign_key "papers", "users"
  add_foreign_key "pdf_resumes", "users"
  add_foreign_key "skills", "users"
  add_foreign_key "wechats", "users"
end
