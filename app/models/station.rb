class Station < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  validates_presence_of :name,
                        :dock_count,
                        :city,
                        :installation_date
  has_many :station_trips
  has_many :trips, through: :station_trips

  has_many :start_trips, class_name: 'Trip', foreign_key: :start_station_id
  has_many :end_trips, class_name: 'Trip', foreign_key: :end_station_id

  def self.average_bikes
    average(:dock_count)
  end

  def self.most_docks
    find_by(dock_count: maximum(:dock_count))
  end

  def self.least_docks
    find_by(dock_count: minimum(:dock_count))
  end

  def self.min_docks
    minimum(:dock_count)
  end

  def self.max_docks
    maximum(:dock_count)
  end

  def self.newest
    find_by(installation_date: maximum(:installation_date))
  end

  def self.oldest
    find_by(installation_date: minimum(:installation_date))
  end

  def started_rides
    Trip.where(start_station_id: id).size
  end

  def ended_rides
    Trip.where(end_station_id: id).size
  end

  def frequent_origin
    end_trips.select('start_station_name, COUNT(start_station_name) AS number')
             .group(:start_station_name)
             .order('number DESC')
             .first
             .try(:start_station_name)
  end

  def frequent_destination
    start_trips.select('end_station_name, COUNT(end_station_name) AS number')
               .group(:end_station_name)
               .order('number DESC')
               .first
               .try(:end_station_name)
  end

  def most_trips_started
    start_trips.select('start_date, COUNT(start_date) AS number')
               .group(:start_date)
               .order('number DESC')
               .first
               .try(:start_date)
  end

  def most_used_zip
    start_trips.select('zip_code, COUNT(zip_code) AS number')
               .group(:zip_code)
               .order('number DESC')
               .first
               .try(:zip_code)
  end

  def most_used_bike
    start_trips.select('bike_id, COUNT(bike_id) AS number')
               .group(:bike_id)
               .order('number DESC')
               .first
               .try(:bike_id)
  end
end
