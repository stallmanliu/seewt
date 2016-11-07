class CreateVideoSummaries < ActiveRecord::Migration
  def change
    create_table :video_summaries do |t|
      t.integer :vid
      t.string :vtname
      t.string :vname
      t.string :vtitle
      t.string :vlanguage
      t.string :vclass
      t.string :vtype
      t.string :vweb
      t.string :vurl
      t.integer :vurl_update_time
      t.string :vdomain
      t.string :vpath
      t.string :vfilename
      t.string :vfileext
      t.string :vbanner_url
      t.string :vsmall_poster_url
      t.string :vmid_poster_url
      t.string :vlarge_poster_url
      t.integer :vupload_time
      t.text :vothers

      t.timestamps null: false
    end
  end
end
