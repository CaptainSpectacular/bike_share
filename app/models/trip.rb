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
  belongs_to :condition, optional: true

  belongs_to :start_station, class_name: 'Station', optional: true
  belongs_to :end_station, class_name: 'Station', optional: true

  self.per_page = 30

  def self.best_weather
    joins(:condition)
      .select('condition_id, count(condition_id) as number')
      .group(:condition_id)
      .order('number DESC')
      .first
      .condition_id
  end

  def self.worst_weather
    joins(:condition)
      .select('condition_id, count(condition_id) as number')
      .group(:condition_id)
      .order('number')
      .first
      .condition_id
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
    station = joins(:start_station)
      .select('trips.start_station_id, count(trips.start_station_id) as number')
      .group('trips.start_station_id')
      .order('number DESC')
      .first
      .try(:start_station_id)
      Station.find(station).try(:name) unless station.nil?
  end

  def self.popular_ending_station
    station = joins(:end_station)
      .select('trips.end_station_id, count(trips.end_station_id) as number')
      .group('trips.end_station_id')
      .order('number DESC')
      .first
      .try(:end_station_id)
      Station.find(station).try(:name) unless station.nil?
  end

  def self.popular_bike
    select('bike_id, count(bike_id) as number')
      .group(:bike_id)
      .order('number DESC')
      .first
  end

  def self.unpopular_bike
    select('bike_id, count(bike_id) as number')
      .group(:bike_id)
      .order('number')
      .first
  end

  def self.group_subscriptions
    group(:subscription_type).count
  end

  def self.subscribtion_breakdown(key)
    [group_subscriptions[key],
      ((group_subscriptions[key].to_f / group_subscriptions.values.sum) * 100).round(2)]
  end

  def self.busy_date
    select('start_date, count(start_date) as number')
      .group(:start_date)
      .order('number DESC')
      .first
  end

  def self.dead_date
    select('start_date, count(start_date) as number')
      .group(:start_date)
      .order('number')
      .first
  end
end
