require 'csv'
require 'chronic'
OPTIONS = { headers: true, header_converters: :symbol }

CSV.foreach('./db/fixtures/conditions.csv', OPTIONS) do |row|
  Condition.create( average_temp: row[:mean_temperature_f],
                    min_temp: row[:min_temperature_f],
                    max_temp: row[:max_temperature_f],
                    average_visibility: row[:mean_visibility_miles],
                    average_windspeed: row[:mean_wind_speed_mph],
                    precipitation: row[:precipitation_inches],
                    date: Chronic.parse(row[:date]),
                    average_humidity: row[:mean_humidity])
end

CSV.foreach('./db/fixtures/trips.csv', OPTIONS) do |row|
  Trip.create( duration: row[:duration],
               start_date: Chronic.parse(row[:start_date]),
               start_station_name: row[:start_station_name],
               start_station_id: row[:start_station_id],
               end_date: Chronic.parse(row[:end_date]),
               end_station_name: row[:end_station_name],
               end_station_id: row[:end_station_id],
               bike_id: row[:bike_id],
               subscription_type: row[:subscription_type],
               zip_code: row[:zip_code],
               condition_id: Condition.find_by(date: Chronic.parse(row[:start_date])).id )
end


CSV.foreach('./db/fixtures/stations.csv', OPTIONS) do |row|
  Station.create( name: row[:name],
                  dock_count: row[:dock_count],
                  city: row[:city],
                  installation_date: row[:installation_date] )
end

CSV.foreach('./db/fixtures/accessories.csv', OPTIONS) do |row|
  Accessory.create(title: row[:title],
                  description: row[:description],
                  price: row[:price],
                  image: row[:image],
                  status: row[:status])
end
