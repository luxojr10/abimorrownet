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

ActiveRecord::Schema.define(version: 20150706235310) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_tokens", force: true do |t|
    t.string   "token"
    t.integer  "profile_id"
    t.datetime "validUntil"
    t.boolean  "admin"
    t.boolean  "extended"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "final"
  end

  add_index "access_tokens", ["profile_id"], name: "index_access_tokens_on_profile_id", using: :btree

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "announcements", force: true do |t|
    t.string   "title"
    t.text     "text"
    t.string   "file"
    t.boolean  "present"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "answers", force: true do |t|
    t.text     "text"
    t.integer  "question_id"
    t.integer  "profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  add_index "answers", ["profile_id"], name: "index_answers_on_profile_id", using: :btree
  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "awards", force: true do |t|
    t.string   "title"
    t.integer  "tiers"
    t.integer  "voting_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "awards", ["voting_id"], name: "index_awards_on_voting_id", using: :btree

  create_table "comments", force: true do |t|
    t.text     "text"
    t.integer  "profile_id"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "committee_roles", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "committee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "committees", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "committees", ["slug"], name: "index_committees_on_slug", unique: true, using: :btree

  create_table "content_associations", force: true do |t|
    t.integer  "content_id"
    t.integer  "profile_id"
    t.boolean  "locked"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "content_associations", ["content_id"], name: "index_content_associations_on_content_id", using: :btree
  add_index "content_associations", ["profile_id"], name: "index_content_associations_on_profile_id", using: :btree

  create_table "content_problems", force: true do |t|
    t.integer  "content_id"
    t.string   "reason"
    t.text     "description"
    t.string   "email"
    t.boolean  "processed"
    t.boolean  "legit"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "profile_id"
  end

  add_index "content_problems", ["content_id"], name: "index_content_problems_on_content_id", using: :btree
  add_index "content_problems", ["profile_id"], name: "index_content_problems_on_profile_id", using: :btree

  create_table "contents", force: true do |t|
    t.string   "title"
    t.string   "kind"
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  add_index "contents", ["user_id"], name: "index_contents_on_user_id", using: :btree

  create_table "delivery_addresses", force: true do |t|
    t.integer  "order_id"
    t.string   "street"
    t.string   "city"
    t.string   "plz"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.string   "kind"
  end

  add_index "delivery_addresses", ["order_id"], name: "index_delivery_addresses_on_order_id", using: :btree

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "groups", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "teacher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "groups", ["slug"], name: "index_groups_on_slug", unique: true, using: :btree

  create_table "nominations", force: true do |t|
    t.integer  "award_id"
    t.integer  "user_id"
    t.integer  "tier"
    t.boolean  "accepted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "nominations", ["award_id"], name: "index_nominations_on_award_id", using: :btree
  add_index "nominations", ["user_id"], name: "index_nominations_on_user_id", using: :btree

  create_table "order_positions", force: true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity"
  end

  add_index "order_positions", ["order_id"], name: "index_order_positions_on_order_id", using: :btree
  add_index "order_positions", ["product_id"], name: "index_order_positions_on_product_id", using: :btree

  create_table "orders", force: true do |t|
    t.text     "description"
    t.integer  "user_id"
    t.text     "address"
    t.string   "plz"
    t.string   "city"
    t.boolean  "processed"
    t.integer  "assigned_id"
    t.boolean  "shipped"
    t.string   "shipping_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "name"
    t.boolean  "ticketable"
    t.string   "token"
  end

  add_index "orders", ["assigned_id"], name: "index_orders_on_assigned_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.decimal  "price"
    t.boolean  "shippable"
    t.boolean  "available"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "ticketable"
    t.integer  "max_people"
  end

  create_table "profiles", force: true do |t|
    t.text     "about"
    t.integer  "profileable_id"
    t.string   "profileable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "slug"
    t.boolean  "premium"
  end

  add_index "profiles", ["slug"], name: "index_profiles_on_slug", unique: true, using: :btree

  create_table "questions", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "teacher"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "fileAllowed"
  end

  create_table "quotes", force: true do |t|
    t.text     "text"
    t.integer  "quotable_id"
    t.string   "quotable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.boolean  "approved",      default: false
    t.datetime "deleted_at"
    t.boolean  "locked"
  end

  add_index "quotes", ["creator_id"], name: "index_quotes_on_creator_id", using: :btree
  add_index "quotes", ["deleted_at"], name: "index_quotes_on_deleted_at", using: :btree

  create_table "student_registrations", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.boolean  "confirmed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teachers", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "slug"
  end

  add_index "teachers", ["slug"], name: "index_teachers_on_slug", unique: true, using: :btree

  create_table "ticket_preference_associations", force: true do |t|
    t.integer  "ticket_id"
    t.integer  "profile_id"
    t.integer  "priority"
    t.boolean  "accepted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ticket_preference_associations", ["profile_id"], name: "index_ticket_preference_associations_on_profile_id", using: :btree
  add_index "ticket_preference_associations", ["ticket_id"], name: "index_ticket_preference_associations_on_ticket_id", using: :btree

  create_table "tickets", force: true do |t|
    t.integer  "product_id"
    t.boolean  "validated"
    t.text     "people",      default: [], array: true
    t.text     "preferences", default: [], array: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "number"
    t.integer  "order_id"
  end

  add_index "tickets", ["order_id"], name: "index_tickets_on_order_id", using: :btree
  add_index "tickets", ["product_id"], name: "index_tickets_on_product_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
    t.boolean  "admin",                  default: false
    t.boolean  "moderator",              default: false
    t.string   "provider"
    t.string   "uid"
    t.integer  "group_id"
    t.boolean  "notify"
    t.string   "stop_key"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["group_id"], name: "index_users_on_group_id", using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "voted_options", force: true do |t|
    t.integer "vote_id"
    t.integer "voting_option_id"
  end

  add_index "voted_options", ["vote_id"], name: "index_voted_options_on_vote_id", using: :btree
  add_index "voted_options", ["voting_option_id"], name: "index_voted_options_on_voting_option_id", using: :btree

  create_table "votes", force: true do |t|
    t.integer  "user_id"
    t.integer  "voting_id"
    t.integer  "voting_option_id"
    t.string   "uid"
    t.boolean  "locked"
    t.integer  "max_choices"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree
  add_index "votes", ["voting_id"], name: "index_votes_on_voting_id", using: :btree
  add_index "votes", ["voting_option_id"], name: "index_votes_on_voting_option_id", using: :btree

  create_table "voting_options", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "voting_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "voting_options", ["user_id"], name: "index_voting_options_on_user_id", using: :btree
  add_index "voting_options", ["voting_id"], name: "index_voting_options_on_voting_id", using: :btree

  create_table "votings", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.boolean  "interactive"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "election"
    t.boolean  "premium"
  end

end
