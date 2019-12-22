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

ActiveRecord::Schema.define(version: 2019_12_22_102038) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "arrivals", force: :cascade do |t|
    t.integer "product_id"
    t.integer "arrival_date"
    t.integer "arrival_quantity"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artists", force: :cascade do |t|
    t.integer "product_id"
    t.string "artist_name"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_name"], name: "index_artists_on_artist_name"
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "product_id"
    t.integer "public_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "charges", force: :cascade do |t|
    t.integer "charge", default: 500
    t.float "tax_rate", default: 1.1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deliveries", force: :cascade do |t|
    t.integer "public_id"
    t.string "zip"
    t.text "address"
    t.string "address_name"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "disks", force: :cascade do |t|
    t.integer "product_id"
    t.string "disk_numbre"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.integer "product_id"
    t.string "genre_name"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_name"], name: "index_genres_on_genre_name"
  end

  create_table "labels", force: :cascade do |t|
    t.integer "product_id"
    t.string "label_name"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["label_name"], name: "index_labels_on_label_name"
  end

  create_table "order_details", force: :cascade do |t|
    t.integer "product_id"
    t.integer "order_id"
    t.integer "quantity"
    t.integer "pre_tax_price"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "public_id"
    t.float "tax_rate"
    t.integer "delivery_charge"
    t.integer "total_price"
    t.integer "delivery_status", default: 0
    t.integer "payment_method", default: 0
    t.text "address"
    t.string "address_name"
    t.string "zip"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["delivery_status"], name: "index_orders_on_delivery_status"
  end

  create_table "products", force: :cascade do |t|
    t.string "product_name"
    t.text "jacket_image_id"
    t.integer "artist_id"
    t.integer "label_id"
    t.integer "genre_id"
    t.integer "disk_id"
    t.integer "stock_status", default: 0
    t.integer "pre_tax_price"
    t.string "release_date"
    t.integer "stock_quantity"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_name"], name: "index_products_on_product_name"
    t.index ["stock_status"], name: "index_products_on_stock_status"
  end

  create_table "publics", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "end_user_last_name"
    t.string "end_user_first_name"
    t.string "end_user_last_kana"
    t.string "end_user_first_kana"
    t.string "zip"
    t.text "address"
    t.string "end_user_phone"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_publics_on_email", unique: true
    t.index ["end_user_first_kana"], name: "index_publics_on_end_user_first_kana"
    t.index ["end_user_first_name"], name: "index_publics_on_end_user_first_name"
    t.index ["end_user_last_kana"], name: "index_publics_on_end_user_last_kana"
    t.index ["end_user_last_name"], name: "index_publics_on_end_user_last_name"
    t.index ["reset_password_token"], name: "index_publics_on_reset_password_token", unique: true
  end

  create_table "songs", force: :cascade do |t|
    t.integer "disk_id"
    t.string "song_title"
    t.integer "song_order"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["song_title"], name: "index_songs_on_song_title"
  end

end
