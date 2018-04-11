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

  def self.temp_ranges
    [0..9,
     10..19,
     20..29,
     30..39,
     40..49,
     50..59,
     60..69,
     70..79,
     80..89,
     90..99,
     100..120]
  end

  def self.trips_with_condition(range)
    joins(:trips)
      .where(max_temp: range)
      .group(:condition_id)
      .count(:condition_id)
      .values
  end

  def self.trips_temp_breakdown
    temp_ranges.map do |range|
      trips = trips_with_condition(range)

      avg = (trips.sum.to_f / trips.size).round(2)
      avg.nan? ? [0, 0, 0] : [trips.min, trips.max, avg]
    end
  end

end
