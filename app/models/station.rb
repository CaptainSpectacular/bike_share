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
    destination = end_trips.group(:start_station_id)
                           .count
                           .max_by { |_k, v| v }

    Station.find(destination[0]) unless destination.nil?
  end

  def frequent_destination
    destination = start_trips.group(:end_station_id)
                             .count
                             .max_by { |_k, v| v }

    Station.find(destination[0]) unless destination.nil?
  end

  def most_trips_started
    start = start_trips.group(:start_date).count.max_by{ |_k, v| v }

    start[0] unless start.nil?
  end

  def most_used_zip
    start = start_trips.group(:zip_code).count.max_by{ |_k, v| v }

    start[0] unless start.nil?
  end

  def most_used_bike
    start = start_trips.group(:bike_id).count.max_by{ |_k, v| v }

    start[0] unless start.nil?
  end
end
