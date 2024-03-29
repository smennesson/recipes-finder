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

ActiveRecord::Schema[7.1].define(version: 2024_03_18_150021) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.string "people_quantity", limit: 15
    t.string "prep_time", limit: 15
    t.string "cook_time", limit: 15
    t.string "total_time", limit: 15
    t.string "budget", limit: 15
    t.decimal "rate"
    t.json "ingredients"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.virtual "ingredients_tsvector", type: :tsvector, as: "json_to_tsvector('english'::regconfig, ingredients, '[\"string\"]'::jsonb)", stored: true
  end

end
