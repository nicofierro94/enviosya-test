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

ActiveRecord::Schema.define(version: 20171028131106) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "info_areas", force: :cascade do |t|
    t.string "cost_to_areas"
    t.string "area_id"
    t.string "area_name"
    t.string "polygon"
  end

  create_table "shipments", force: :cascade do |t|
    t.string "origin"
    t.string "destination"
    t.integer "price"
    t.string "sender_mail"
    t.string "receiver_mail"
    t.string "cadet_mail"
    t.string "origin_postal_address"
    t.string "destination_postal_address"
    t.boolean "is_price_estimated"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "kilos"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name"
    t.string "profile_picture"
    t.string "access_token"
    t.string "id_card"
    t.integer "role"
    t.boolean "is_first_time", default: true
    t.string "password"
    t.boolean "can_sign_in_with_password"
    t.string "state"
    t.string "drivers_license"
    t.string "car_documentation"
    t.string "discount_pending"
    t.string "create_at"
    t.string "datetime"
    t.string "update_at"
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["provider"], name: "index_users_on_provider"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["state"], name: "index_users_on_state"
    t.index ["uid"], name: "index_users_on_uid"
  end

end
