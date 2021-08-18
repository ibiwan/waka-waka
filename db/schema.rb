# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_17_231216) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "article_sections", force: :cascade do |t|
    t.bigint "article_id", null: false
    t.bigint "section_id", null: false
    t.bigint "edit_id", null: false
    t.integer "order_key"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["article_id"], name: "index_article_sections_on_article_id"
    t.index ["edit_id"], name: "index_article_sections_on_edit_id"
    t.index ["section_id"], name: "index_article_sections_on_section_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "edits", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "article_id"
    t.bigint "section_id"
    t.bigint "paragraph_id"
    t.string "edit_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["article_id"], name: "index_edits_on_article_id"
    t.index ["paragraph_id"], name: "index_edits_on_paragraph_id"
    t.index ["section_id"], name: "index_edits_on_section_id"
    t.index ["user_id"], name: "index_edits_on_user_id"
  end

  create_table "paragraphs", force: :cascade do |t|
    t.string "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "section_paragraphs", force: :cascade do |t|
    t.bigint "section_id", null: false
    t.bigint "paragraph_id", null: false
    t.bigint "edit_id", null: false
    t.integer "order_key"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["edit_id"], name: "index_section_paragraphs_on_edit_id"
    t.index ["paragraph_id"], name: "index_section_paragraphs_on_paragraph_id"
    t.index ["section_id"], name: "index_section_paragraphs_on_section_id"
  end

  create_table "section_subsections", force: :cascade do |t|
    t.bigint "parent_section_id", null: false
    t.bigint "sub_section_id", null: false
    t.bigint "edit_id", null: false
    t.integer "order_key"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["edit_id"], name: "index_section_subsections_on_edit_id"
    t.index ["parent_section_id"], name: "index_section_subsections_on_parent_section_id"
    t.index ["sub_section_id"], name: "index_section_subsections_on_sub_section_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string "heading"
    t.boolean "is_text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "article_sections", "articles"
  add_foreign_key "article_sections", "edits"
  add_foreign_key "article_sections", "sections"
  add_foreign_key "edits", "articles"
  add_foreign_key "edits", "paragraphs"
  add_foreign_key "edits", "sections"
  add_foreign_key "edits", "users"
  add_foreign_key "section_paragraphs", "edits"
  add_foreign_key "section_paragraphs", "paragraphs"
  add_foreign_key "section_paragraphs", "sections"
  add_foreign_key "section_subsections", "edits"
  add_foreign_key "section_subsections", "sections", column: "parent_section_id"
  add_foreign_key "section_subsections", "sections", column: "sub_section_id"
  add_foreign_key "sessions", "users"
end
