class Station < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  validates_presence_of :name,
                        :dock_count,
                        :city,
                        :installation_date
  has_many :station_trips
  has_many :trips, through: :station_trips

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
end
