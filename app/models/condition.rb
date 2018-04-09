class Condition < ApplicationRecord
  validates_presence_of :date,
                        :max_temp,
                        :average_temp,
                        :min_temp,
                        :average_humidity,
                        :average_visibility,
                        :average_windspeed,
                        :precipitation
end
