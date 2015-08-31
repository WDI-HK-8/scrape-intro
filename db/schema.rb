# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150831070450) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "annual_incomes", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "currency"
    t.date     "period"
    t.decimal  "revenue"
    t.decimal  "other_revenue"
    t.decimal  "total_revenue"
    t.decimal  "total_cost_of_revenue"
    t.decimal  "gross_profit"
    t.decimal  "general_expense"
    t.decimal  "randd"
    t.decimal  "depreciation"
    t.decimal  "interest_expense"
    t.decimal  "unusual_expense"
    t.decimal  "other_operating_expense"
    t.decimal  "total_operating_expense"
    t.decimal  "operating_income"
    t.decimal  "interest_income"
    t.decimal  "gain_on_sale_of_asset"
    t.decimal  "other_income"
    t.decimal  "income_before_tax"
    t.decimal  "income_after_tax"
    t.decimal  "minority_interest"
    t.decimal  "equity_in_affiliates"
    t.decimal  "net_income_before_extra_item"
    t.decimal  "accounting_change"
    t.decimal  "discontinued_operations"
    t.decimal  "extra_item"
    t.decimal  "net_income"
    t.decimal  "preferred_dividends"
    t.decimal  "income_available_to_common_excl_extra"
    t.decimal  "income_available_to_common_incl_extra"
    t.decimal  "basic_weighted_average_shares"
    t.decimal  "basic_eps_excl_extra_items"
    t.decimal  "basic_eps_incl_extra_items"
    t.decimal  "dilution_adjustment"
    t.decimal  "diluted_weighted_average_shares"
    t.decimal  "diluted_eps_exclextra_items"
    t.decimal  "diluted_eps_inclextra_items"
    t.decimal  "dividends_per_share"
    t.decimal  "gross_dividends"
    t.decimal  "net_income_after_stock_expense"
    t.decimal  "basic_eps_after_stock_expense"
    t.decimal  "diluted_eps_after_stock_expense"
    t.decimal  "supplement_depreciation"
    t.decimal  "total_special_items"
    t.decimal  "normalized_income_before_taxes"
    t.decimal  "effect_of_special_items_on_income_taxes"
    t.decimal  "income_taxes_impact_of_special_items"
    t.decimal  "normalized_income_after_taxes"
    t.decimal  "normalized_income_avail_to_common"
    t.decimal  "basic_normalized_eps"
    t.decimal  "diluted_normalized_eps"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "annual_incomes", ["company_id"], name: "index_annual_incomes_on_company_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "symbol"
    t.string   "name"
    t.decimal  "last_sale"
    t.integer  "market_cap",    limit: 8
    t.string   "ardtso"
    t.string   "ipo_year"
    t.string   "sector"
    t.string   "industry"
    t.string   "summary_quote"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_foreign_key "annual_incomes", "companies"
end
