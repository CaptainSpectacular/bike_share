module Conditions
  class DashboardController < ApplicationController
    def index
      @trip_temp_breakdown = Condition.trips_temp_breakdown
      @trip_pre_breakdown  = Condition.trips_precipitation_breakdown
    end
  end
end