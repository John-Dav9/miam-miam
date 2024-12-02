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

ActiveRecord::Schema[7.2].define(version: 2024_12_01_204146) do
  create_table "ingredients", force: :cascade do |t|
    t.string "nom"
    t.string "quantité"
    t.integer "recettes_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recettes_id"], name: "index_ingredients_on_recettes_id"
  end

  create_table "recettes", force: :cascade do |t|
    t.string "nom"
    t.string "description"
    t.string "categorie"
    t.string "durée"
    t.string "pays"
    t.string "ingredients"
    t.string "préparation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "ingredients", "recettes", column: "recettes_id"
end
