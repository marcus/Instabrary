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

ActiveRecord::Schema.define(:version => 20100306191235) do

  create_table "book_statuses", :force => true do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.integer  "status_id"
    t.boolean  "active",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", :force => true do |t|
    t.string   "title"
    t.string   "isbn",                    :limit => 50
    t.string   "authors"
    t.text     "editorial_review"
    t.string   "editorial_review_source"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "affiliate_link"
    t.string   "small_image"
    t.string   "medium_image"
    t.string   "large_image"
    t.integer  "pages"
    t.string   "book_binding",            :limit => 50
    t.string   "label"
    t.string   "edition",                 :limit => 50
    t.string   "publisher"
    t.date     "publication_date"
    t.integer  "list_price"
    t.integer  "lowest_new_price"
    t.integer  "small_image_height"
    t.integer  "small_image_width"
    t.integer  "medium_image_height"
    t.integer  "medium_image_width"
    t.integer  "large_image_height"
    t.integer  "large_image_width"
    t.decimal  "rating_average",                        :precision => 3, :scale => 1
    t.boolean  "has_cover",                                                           :default => false
    t.string   "small_cover"
    t.string   "medium_cover"
    t.string   "large_cover"
  end

  create_table "booksearches", :force => true do |t|
    t.string   "keyword"
    t.integer  "bookset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "booksets", :force => true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.text     "description"
    t.string   "author",          :limit => 100
    t.string   "source_name"
    t.string   "source_uri"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "knowledge_level", :limit => 50
    t.string   "qualifications"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.string   "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "listings", :force => true do |t|
    t.integer  "book_id"
    t.integer  "bookset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rates", :force => true do |t|
    t.integer  "user_id"
    t.integer  "rateable_id"
    t.string   "rateable_type", :limit => 30
    t.integer  "rate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["rateable_id"], :name => "index_rates_on_rateable_id"
  add_index "rates", ["user_id"], :name => "index_rates_on_user_id"

  create_table "statuses", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.string   "persistence_token",                                      :null => false
    t.string   "single_access_token",                                    :null => false
    t.string   "perishable_token",                                       :null => false
    t.integer  "login_count",                             :default => 0, :null => false
    t.integer  "failed_login_count",                      :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
  end

end
