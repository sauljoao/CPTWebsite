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

ActiveRecord::Schema[8.1].define(version: 2026_07_08_090600) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
  end

  create_table "contact_requests", force: :cascade do |t|
    t.string "company"
    t.datetime "created_at", null: false
    t.string "email", null: false
    t.text "message", null: false
    t.string "name", null: false
    t.string "request_type", default: "contact", null: false
    t.string "status", default: "new", null: false
    t.datetime "updated_at", null: false
    t.index ["status", "created_at"], name: "index_contact_requests_on_status_and_created_at"
  end

  create_table "faqs", force: :cascade do |t|
    t.text "answer", null: false
    t.string "category", default: "General", null: false
    t.datetime "created_at", null: false
    t.integer "position", default: 0, null: false
    t.boolean "published", default: true, null: false
    t.string "question", null: false
    t.datetime "updated_at", null: false
    t.index ["published", "position"], name: "index_faqs_on_published_and_position"
  end

  create_table "portfolio_projects", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.boolean "featured", default: false, null: false
    t.string "industry", null: false
    t.text "outcome", null: false
    t.integer "position", default: 0, null: false
    t.string "product_type", default: "Website", null: false
    t.boolean "published", default: true, null: false
    t.jsonb "services", default: [], null: false
    t.string "slug", null: false
    t.text "summary", null: false
    t.string "title", null: false
    t.datetime "updated_at", null: false
    t.index ["product_type", "published", "position"], name: "idx_portfolio_projects_product_type"
    t.index ["published", "featured", "position"], name: "idx_portfolio_projects_visibility"
    t.index ["slug"], name: "index_portfolio_projects_on_slug", unique: true
  end

  create_table "products", force: :cascade do |t|
    t.integer "base_price_cents", null: false
    t.datetime "created_at", null: false
    t.string "cta_label", default: "Request a quote", null: false
    t.text "description", null: false
    t.jsonb "features", default: [], null: false
    t.string "name", null: false
    t.integer "position", default: 0, null: false
    t.boolean "published", default: true, null: false
    t.string "slug", null: false
    t.datetime "updated_at", null: false
    t.index ["published", "position"], name: "index_products_on_published_and_position"
    t.index ["slug"], name: "index_products_on_slug", unique: true
  end

  create_table "quote_requests", force: :cascade do |t|
    t.string "company"
    t.jsonb "configuration", default: {}, null: false
    t.datetime "created_at", null: false
    t.string "email", null: false
    t.integer "estimated_price_cents", default: 0, null: false
    t.text "message"
    t.string "name", null: false
    t.bigint "product_id"
    t.string "status", default: "new", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_quote_requests_on_product_id"
    t.index ["status", "created_at"], name: "index_quote_requests_on_status_and_created_at"
  end

  add_foreign_key "quote_requests", "products"
end
