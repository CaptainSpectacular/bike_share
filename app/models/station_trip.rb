class StationTrip < ApplicationRecord
  belongs_to :station
  belongs_to :trip
end
