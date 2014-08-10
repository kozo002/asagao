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

ActiveRecord::Schema.define(version: 20140728143904) do

  create_table "admins", force: true do |t|
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["confirmation_token"], name: "index_admins_on_confirmation_token", unique: true
  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  add_index "admins", ["unlock_token"], name: "index_admins_on_unlock_token", unique: true

  create_table "articles", force: true do |t|
    t.string   "slug"
    t.string   "title"
    t.text     "content"
    t.datetime "published_at"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["published_at"], name: "index_articles_on_published_at"
  add_index "articles", ["slug"], name: "index_articles_on_slug", unique: true
  add_index "articles", ["title"], name: "index_articles_on_title"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.integer  "position"
    t.string   "ancestry"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["position", "ancestry"], name: "index_categories_on_position_and_ancestry"
  add_index "categories", ["slug"], name: "index_categories_on_slug", unique: true

  create_table "categorizations", force: true do |t|
    t.string   "categorizable_type"
    t.integer  "categorizable_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categorizations", ["categorizable_type", "categorizable_id"], name: "categorizable_index"
  add_index "categorizations", ["category_id"], name: "index_categorizations_on_category_id"

  create_table "image_attachments", force: true do |t|
    t.string   "attachable_type"
    t.integer  "attachable_id"
    t.integer  "position"
    t.integer  "image_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "image_attachments", ["attachable_type", "attachable_id"], name: "attachable_index"

  create_table "images", force: true do |t|
    t.string   "image"
    t.string   "title"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "slug"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["slug", "published_at"], name: "index_products_on_slug_and_published_at"

end
