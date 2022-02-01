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

ActiveRecord::Schema.define(version: 2022_02_01_233503) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "login"
    t.string "password"
  end

  create_table "autors", force: :cascade do |t|
    t.string "imie"
    t.string "nazwisko"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "books", force: :cascade do |t|
    t.string "tytul"
    t.date "rok_wydania"
    t.text "opis"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "publisher_id"
    t.bigint "category_id"
    t.bigint "autor_id"
    t.index ["autor_id"], name: "index_books_on_autor_id"
    t.index ["category_id"], name: "index_books_on_category_id"
    t.index ["publisher_id"], name: "index_books_on_publisher_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "nazwa"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "login"
    t.string "haslo"
    t.date "data_urodzenia"
    t.string "imie"
    t.string "nazwisko"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "role_id"
    t.index ["role_id"], name: "index_employees_on_role_id"
  end

  create_table "publishers", force: :cascade do |t|
    t.string "nazwa"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "punishments", force: :cascade do |t|
    t.float "kwota"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "reader_id"
    t.index ["reader_id"], name: "index_punishments_on_reader_id"
  end

  create_table "readers", force: :cascade do |t|
    t.string "imie"
    t.string "nazwisko"
    t.string "telefon"
    t.date "data_urodzenia"
    t.string "email"
    t.string "haslo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rents", force: :cascade do |t|
    t.date "planowana_data_oddania"
    t.date "data_wypozyczenia"
    t.date "data_oddania"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "book_id"
    t.bigint "reader_id"
    t.integer "employee_rent_id"
    t.integer "employee_return_id"
    t.index ["book_id"], name: "index_rents_on_book_id"
    t.index ["reader_id"], name: "index_rents_on_reader_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "nazwa"
    t.float "wyplata"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "books", "autors"
  add_foreign_key "books", "categories"
  add_foreign_key "books", "publishers"
  add_foreign_key "employees", "roles"
  add_foreign_key "punishments", "readers"
  add_foreign_key "rents", "books"
  add_foreign_key "rents", "readers"
end
