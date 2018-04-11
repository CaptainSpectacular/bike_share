module Conditions
  class DashboardController < ApplicationController
    def index
      @trip_temp_breakdown    = Condition.trips_temp_breakdown
      @trip_pre_breakdown     = Condition.trips_precipitation_breakdown
      @trip_wind_breakdown    = Condition.trips_windspeed_breakdown
      @trip_visible_breakdown = Condition.trips_visibility_breakdown
    end
  end
end