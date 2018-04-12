class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.integer :duration
      t.date :start_date
      t.string :start_station_name
      t.integer :start_station_id
      t.date :end_date
      t.string :end_station_name
      t.integer :end_station_id
      t.integer :bike_id
      t.string :subscription_type
      t.integer :zip_code
    end
  end
end
