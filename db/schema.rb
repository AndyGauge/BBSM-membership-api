# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_01_23_163259) do

  create_table "keys", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "token"
    t.string "giving"
    t.string "key"
    t.string "street"
    t.string "city"
    t.string "province"
    t.string "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "striped_customers", force: :cascade do |t|
    t.string "email"
    t.string "description"
    t.string "response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "payment_id"
    t.string "stripe_id"
    t.index ["payment_id"], name: "index_striped_customers_on_payment_id"
  end

  create_table "striped_plans", force: :cascade do |t|
    t.integer "amount"
    t.integer "striped_product_id"
    t.string "response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "payment_id"
    t.string "stripe_id"
    t.index ["payment_id"], name: "index_striped_plans_on_payment_id"
    t.index ["striped_product_id"], name: "index_striped_plans_on_striped_product_id"
  end

  create_table "striped_products", force: :cascade do |t|
    t.string "name"
    t.string "product_type"
    t.string "response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "stripe_id"
  end

  create_table "striped_subscriptions", force: :cascade do |t|
    t.integer "striped_customer_id"
    t.integer "striped_plan_id"
    t.string "response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "payment_id"
    t.string "stripe_id"
    t.index ["payment_id"], name: "index_striped_subscriptions_on_payment_id"
    t.index ["striped_customer_id"], name: "index_striped_subscriptions_on_striped_customer_id"
    t.index ["striped_plan_id"], name: "index_striped_subscriptions_on_striped_plan_id"
  end

  create_table "striped_webhooks", force: :cascade do |t|
    t.string "event"
    t.integer "striped_subscription_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["striped_subscription_id"], name: "index_striped_webhooks_on_striped_subscription_id"
  end

end
