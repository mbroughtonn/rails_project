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

ActiveRecord::Schema[8.0].define(version: 2025_03_06_210237) do
  create_table "consoles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "consoles_games", id: false, force: :cascade do |t|
    t.integer "game_id", null: false
    t.integer "console_id", null: false
    t.index ["console_id"], name: "index_consoles_games_on_console_id"
    t.index ["game_id"], name: "index_consoles_games_on_game_id"
  end

  create_table "game_consoles", force: :cascade do |t|
    t.integer "game_id", null: false
    t.integer "console_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["console_id"], name: "index_game_consoles_on_console_id"
    t.index ["game_id"], name: "index_game_consoles_on_game_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "title"
    t.integer "release_year"
    t.string "rating"
    t.integer "publisher_id", null: false
    t.integer "genre_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "console"
    t.text "description"
    t.index ["genre_id"], name: "index_games_on_genre_id"
    t.index ["publisher_id"], name: "index_games_on_publisher_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "permalink"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publishers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "game_consoles", "consoles"
  add_foreign_key "game_consoles", "games"
  add_foreign_key "games", "genres"
  add_foreign_key "games", "publishers"
end
