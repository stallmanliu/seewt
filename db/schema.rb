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

ActiveRecord::Schema.define(version: 20161105050451) do

  create_table "video_details", force: :cascade do |t|
    t.integer  "vid"
    t.string   "vtname"
    t.string   "vname"
    t.string   "vtitle"
    t.string   "vlanguage"
    t.string   "vcountry"
    t.string   "vclass"
    t.string   "vcategory"
    t.string   "vyear"
    t.integer  "vdate"
    t.string   "vdirector"
    t.string   "vactors"
    t.string   "vsummary"
    t.string   "vdescription"
    t.integer  "vgood_counter"
    t.integer  "vbad_counter"
    t.integer  "vdownload_counter"
    t.float    "vimdb_rate"
    t.float    "vdouban_rate"
    t.integer  "vduration"
    t.string   "vsimilars"
    t.text     "vothers"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "video_summaries", force: :cascade do |t|
    t.integer  "vid"
    t.string   "vtname"
    t.string   "vname"
    t.string   "vtitle"
    t.string   "vlanguage"
    t.string   "vclass"
    t.string   "vtype"
    t.string   "vweb"
    t.string   "vurl"
    t.integer  "vurl_update_time"
    t.string   "vdomain"
    t.string   "vpath"
    t.string   "vfilename"
    t.string   "vfileext"
    t.string   "vbanner_url"
    t.string   "vsmall_poster_url"
    t.string   "vmid_poster_url"
    t.string   "vlarge_poster_url"
    t.integer  "vupload_time"
    t.text     "vothers"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

end
