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

ActiveRecord::Schema[7.0].define(version: 2024_03_09_092658) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "participant_estimates", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "poker_session_participant_id", null: false
    t.string "value", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["poker_session_participant_id"], name: "index_participant_estimates_on_poker_session_participant_id"
  end

  create_table "poker_session_participants", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.uuid "poker_session_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["poker_session_id"], name: "index_poker_session_participants_on_poker_session_id"
    t.index ["user_id"], name: "index_poker_session_participants_on_user_id"
  end

  create_table "poker_sessions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "estimates", null: false
    t.string "password_digest", null: false
    t.uuid "creator_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_poker_sessions_on_creator_id"
  end

  create_table "tasks", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "poker_session_id", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["poker_session_id"], name: "index_tasks_on_poker_session_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_users_on_name", unique: true
  end

  add_foreign_key "participant_estimates", "poker_session_participants", on_delete: :cascade
  add_foreign_key "poker_session_participants", "poker_sessions", on_delete: :cascade
  add_foreign_key "poker_session_participants", "users", on_delete: :cascade
  add_foreign_key "poker_sessions", "users", column: "creator_id", on_delete: :cascade
  add_foreign_key "tasks", "poker_sessions", on_delete: :cascade
end
