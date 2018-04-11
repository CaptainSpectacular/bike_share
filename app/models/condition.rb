class Condition < ApplicationRecord
  validates_presence_of :date,
                        :max_temp,
                        :average_temp,
                        :min_temp,
                        :average_humidity,
                        :average_visibility,
                        :average_windspeed,
                        :precipitation
  has_many :trips

  def self.avg_trips_with_condition(temp_range = (50..60))
    trips = joins(:trips)
            .where(max_temp: temp_range)
            .group(:condition_id)
            .count(:condition_id)
            .values

    (trips.sum.to_f / trips.size).round(2)
  end
end
