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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120929070725) do

  create_table "actividads", :force => true do |t|
    t.string   "nombre"
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "fase_id"
    t.boolean  "estado"
  end

  create_table "archivos", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "adjunto_file_name"
    t.string   "adjunto_content_type"
    t.integer  "adjunto_file_size"
    t.datetime "adjunto_updated_at"
    t.string   "detalle"
    t.boolean  "valida"
    t.integer  "fase_id"
  end

  create_table "fases", :force => true do |t|
    t.string   "nombre"
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "proyecto_id"
    t.boolean  "estado"
    t.string   "adjunto_file_name"
    t.string   "adjunto_content_type"
    t.integer  "adjunto_file_size"
    t.datetime "adjunto_updated_at"
    t.integer  "achivo_id"
  end

  create_table "mantenedors", :force => true do |t|
    t.string   "tipo"
    t.string   "valor",      :limit => 1023
    t.string   "misc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "codigo"
  end

  create_table "proyectos", :force => true do |t|
    t.string   "nombre"
    t.datetime "fechainicio"
    t.datetime "fechatermino"
    t.string   "ambiente"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "porcentaje"
  end

  create_table "proyectos_users", :force => true do |t|
    t.integer  "proyecto_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reports", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["nombre"], :name => "index_roles_on_nombre"

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "sequence", "scope"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

  create_table "userroles", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "nombre"
    t.string   "login"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.integer  "login_count"
    t.integer  "failed_login_count"
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "proyecto_id"
  end

  add_index "users", ["login"], :name => "index_users_on_login"
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token"

end
