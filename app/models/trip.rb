class Trip < ApplicationRecord
  validates_presence_of :duration,
                        :start_date,
                        :start_station_name,
                        :start_station_id,
                        :end_date,
                        :end_station_name,
                        :end_station_id,
                        :bike_id,
                        :subscription_type,
                        :zip_code
  belongs_to :condition, optional: true
  has_many :station_trips
  has_many :stations, through: :trips

  self.per_page = 30

  def self.best_weather
    joins(:condition)
      .group(:condition_id)
      .count(:condition_id)
      .max_by { |_k, v| v }[0]
  end

  def self.worst_weather
    joins(:condition)
      .group(:condition_id)
      .count(:condition_id)
      .min_by { |_k, v| v }[0]
  end
end
