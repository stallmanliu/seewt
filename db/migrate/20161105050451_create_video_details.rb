class CreateVideoDetails < ActiveRecord::Migration
  def change
    create_table :video_details do |t|
      t.integer :vid
      t.string :vtname
      t.string :vname
      t.string :vtitle
      t.string :vlanguage
      t.string :vcountry
      t.string :vclass
      t.string :vcategory
      t.string :vyear
      t.integer :vdate
      t.string :vdirector
      t.string :vactors
      t.string :vsummary
      t.string :vdescription
      t.integer :vgood_counter
      t.integer :vbad_counter
      t.integer :vdownload_counter
      t.float :vimdb_rate
      t.float :vdouban_rate
      t.integer :vduration
      t.string :vsimilars
      t.text :vothers

      t.timestamps null: false
    end
  end
end