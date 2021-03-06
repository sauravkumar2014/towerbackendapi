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

ActiveRecord::Schema.define(version: 20180114074757) do

  create_table "crono_jobs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "job_id", null: false
    t.text "log", limit: 4294967295
    t.datetime "last_performed_at"
    t.boolean "healthy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_crono_jobs_on_job_id", unique: true
  end

  create_table "currencyinfos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "symbol"
    t.string "currencyname"
    t.float "latestPrice", limit: 24
    t.float "latesttxVolume", limit: 24
    t.float "latestmarketcap", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "currencyprices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "symbol"
    t.date "date"
    t.float "txVolume", limit: 24
    t.float "txCount", limit: 24
    t.float "marketcap", limit: 24
    t.float "price", limit: 24
    t.float "exchangeVolume", limit: 24
    t.float "generatedCoins", limit: 24
    t.float "fees", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
