class Station < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  validates_presence_of :name,
                        :dock_count,
                        :city,
                        :installation_date
  has_many :station_trios
  has_many :trips, through: :station_trips
end
