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

  def self.trips_temp_breakdown
    temp_ranges.map do |range|
      trips = trips_with_temp(range)
      avg = calc_avg(trips)

      return_values(avg, trips)
    end
  end

  def self.trips_precipitation_breakdown
    pre_ranges.map do |range|
      trips = trips_with_pre(range)
      avg = calc_avg(trips)

      return_values(avg, trips)
    end
  end

  private 

  def self.calc_avg(trips)
    (trips.sum.to_f) / (trips.size).round(2)
  end

  def self.return_values(avg, trips)
    avg.nan? ? [0, 0, 0] : [trips.min, trips.max, avg]
  end

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

    # Maybe make it more dynamic later?
    # ((minimum(:max_temp).floor(-1)).to_i..(maximum(:max_temp).ceil(-1).to_i)).step(10)

  end

  def self.pre_ranges
    [0..0.5,
     0.5..1]
  end

  def self.wind_ranges
    [0..4,
     5..9,
     10..14]
  end

end
