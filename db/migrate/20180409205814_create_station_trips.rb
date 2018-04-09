class CreateStationTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :station_trips do |t|
      t.references :station, foreign_key: true
      t.references :trip, foreign_key: true
    end
  end
end
