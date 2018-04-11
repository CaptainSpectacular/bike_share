class Trip < ApplicationRecord
  validates_presence_of :duration,
                        :start_date,
                        :start_station_name,
                        :start_station_id,
                        :end_date,
                        :end_station_name,
                        :end_station_id,
                        :bike_id,
                        :subscription_type
  has_many :station_trips
  has_many :stations, through: :trips

  self.per_page = 30
end
