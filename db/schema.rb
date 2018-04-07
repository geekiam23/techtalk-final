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

ActiveRecord::Schema.define(version: 20180320220103) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "following_relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["followed_user_id"], name: "index_following_relationships_on_followed_user_id", using: :btree
    t.index ["follower_id"], name: "index_following_relationships_on_follower_id", using: :btree
  end

  create_table "guests", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_posts", force: :cascade do |t|
    t.string   "title",                            null: false
    t.text     "body",                             null: false
    t.string   "link",                             null: false
    t.integer  "salary"
    t.string   "location",                         null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "content_type", default: "JobPost"
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_likes_on_post_id", using: :btree
    t.index ["user_id", "post_id"], name: "index_likes_on_user_id_and_post_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_likes_on_user_id", using: :btree
  end

  create_table "meeting_posts", force: :cascade do |t|
    t.string   "title",                                null: false
    t.text     "body",                                 null: false
    t.date     "date",                                 null: false
    t.time     "time",                                 null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "content_type", default: "MeetingPost"
  end

  create_table "pic_posts", force: :cascade do |t|
    t.string   "image_file_name",                        null: false
    t.string   "image_content_type",                     null: false
    t.integer  "image_file_size",                        null: false
    t.datetime "image_updated_at",                       null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "content_type",       default: "PicPost"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "content_type"
    t.integer  "content_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["content_type", "content_id"], name: "index_posts_on_content_type_and_content_id", using: :btree
    t.index ["user_id"], name: "index_posts_on_user_id", using: :btree
  end

  create_table "project_posts", force: :cascade do |t|
    t.string   "title",                                null: false
    t.text     "body",                                 null: false
    t.string   "link"
    t.string   "repo"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "content_type", default: "ProjectPost"
  end

  create_table "text_posts", force: :cascade do |t|
    t.string   "body",                              null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "content_type", default: "TextPost"
  end

  create_table "timelines", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean  "allow_password_change",  default: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "email"
    t.string   "tokens"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "username"
    t.integer  "followed_users_count",   default: 0,       null: false
    t.integer  "followers_count",        default: 0,       null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  add_foreign_key "likes", "posts"
  add_foreign_key "likes", "users"
  add_foreign_key "posts", "users"
end
