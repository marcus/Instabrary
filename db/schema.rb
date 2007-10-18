# This file is autogenerated. Instead of editing this file, please use the
# migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.

ActiveRecord::Schema.define(:version => ) do

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
    t.string   "binding",                 :limit => 50
    t.string   "label"
    t.string   "edition",                 :limit => 50
    t.string   "publisher"
    t.date     "release_date"
    t.integer  "list_price",              :limit => 10
    t.integer  "lowest_new_price",        :limit => 10
    t.integer  "small_image_height",      :limit => 3
    t.integer  "small_image_width",       :limit => 3
    t.integer  "medium_image_height",     :limit => 3
    t.integer  "medium_image_width",      :limit => 3
    t.integer  "large_image_height",      :limit => 3
    t.integer  "large_image_width",       :limit => 3
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

  create_table "listings", :force => true do |t|
    t.integer  "book_id"
    t.integer  "bookset_id"
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
  end

end
