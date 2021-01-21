class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
    	t.uuid :scooter_id
    	t.float :battery_level
    	t.st_point :lonlat, geographic: true
    	t.index :lonlat, using: "gist"
    	t.timestamps
    end
    add_foreign_key :reports, :scooters
  end
end
