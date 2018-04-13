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

  belongs_to :start_station, class_name: 'Station', optional: true
  belongs_to :end_station, class_name: 'Station', optional: true

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

  def self.average_duration
    average(:duration)
  end

  def self.min_duration
    minimum(:duration)
  end

  def self.max_duration
    maximum(:duration)
  end

  def self.group_by_month
    group("DATE_TRUNC('month', start_date)").count
  end

  def self.beautify_group_by_month
    months = group_by_month

    formatted = months.keys.map do |month|
      month.strftime('%Y-%m')
    end

    formatted.zip(months.values).to_h
  end

  def self.popular_starting_station
    station_id = joins(:start_station)
                   .group(:start_station_id)
                   .count
                   .max_by { |_k, v| v }
    Station.find(station_id[0]).name unless station_id.nil?
  end

  def self.popular_ending_station
    station_id = joins(:end_station)
    .group(:end_station_id)
    .count
    .max_by { |_k, v| v }
    Station.find(station_id[0]).name unless station_id.nil?
  end

  def self.bike_use
    group(:bike_id)
      .count
  end

  def self.popular_bike
    bikes = bike_use
    bikes.max_by { |_k, v| v } unless bikes.nil?
  end

  def self.unpopular_bike
    bikes = bike_use
    bikes.min_by { |_k, v| v } unless bikes.nil?
  end

  def self.group_subscriptions
    group(:subscription_type).count
  end

  def self.subscribtion_breakdown(key)
    [group_subscriptions[key],
      ((group_subscriptions[key].to_f / group_subscriptions.values.sum) * 100).round(2)]
  end

  def self.group_date
    group(:start_date).count
  end

  def self.busy_date
    group_date.max_by { |_k, v| v }
  end

  def self.dead_date
    group_date.min_by { |_k, v| v }
  end
end
