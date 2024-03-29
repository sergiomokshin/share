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

ActiveRecord::Schema.define(:version => 20120326221656) do

  create_table "attachments", :force => true do |t|
    t.string   "description"
    t.string   "path"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "description"
    t.string   "color"
    t.integer  "user_id"
    t.boolean  "active"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "font_color"
  end

  create_table "comments", :force => true do |t|
    t.string   "description"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "links", :force => true do |t|
    t.string   "description"
    t.string   "url"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "subject"
    t.text     "body"
    t.integer  "category_id"
    t.boolean  "public"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "posts_users", :id => false, :force => true do |t|
    t.integer "post_id"
    t.integer "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.boolean  "active"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "image"
  end

end
