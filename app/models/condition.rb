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

  def self.trips_with_temp(range)
    joins(:trips)
      .where(max_temp: range)
      .group(:condition_id)
      .count(:condition_id)
      .values
  end

  def self.trips_with_pre(range)
    joins(:trips)
      .where(precipitation: range)
      .group(:condition_id)
      .count(:condition_id)
      .values
  end

  def self.trips_with_wind(range)
    joins(:trips)
      .where(average_windspeed: range)
      .group(:condition_id)
      .count(:condition_id)
      .values
  end

  def self.trips_with_visibility(range)
    joins(:trips)
      .where(average_visibility: range)
      .group(:condition_id)
      .count(:condition_id)
      .values
  end

  def self.trips_temp_breakdown
    temp_ranges.map do |range|
      trips = trips_with_temp(range)
      avg = calc_avg(trips)

      return_values(range, avg, trips)
    end
  end

  def self.trips_precipitation_breakdown
    pre_ranges.map do |range|
      trips = trips_with_pre(range)
      avg = calc_avg(trips)

      return_values(range, avg, trips)
    end
  end

  def self.trips_visibility_breakdown
    visible_ranges.map do |range|
      trips = trips_with_visibility(range)
      avg = calc_avg(trips)

      return_values(range, avg, trips)
    end
  end

  def self.trips_windspeed_breakdown
    wind_ranges.map do |range|
      trips = trips_with_wind(range)
      avg = calc_avg(trips)

      return_values(range, avg, trips)
    end
  end

  private 

  def self.calc_avg(trips)
    (trips.sum.to_f) / (trips.size).round(2)
  end

  def self.return_values(range, avg, trips)
    avg.nan? ? ["#{range.first} - #{range.last}", 0, 0, 0] : ["#{range.first} - #{range.last}", trips.min, trips.max, avg]
  end

  def self.temp_ranges
    [40..49,
     50..59,
     60..69,
     70..79,
     80..89,
     90..99,
     100..110]
  end

  def self.pre_ranges
    [0..0.49,
     0.5..0.99,
     1..1.49,
     1.5..1.99,
     2..2.49,
     2.5..3]
  end

  def self.wind_ranges
    [0..3,
     4..7,
     8..11,
     12..15,
     16..19,
     20..23]
  end

  def self.visible_ranges
    [4..7,
    8..11,
    12..15,
    16..19,
    20..23]
  end
end
