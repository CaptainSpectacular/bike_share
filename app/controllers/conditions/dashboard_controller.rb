module Conditions
  class DashboardController < ApplicationController
    def index
      @avg_trips_per_condition = Condition.average_trips_in_conditions
      @max_trip_per_condition  = Condition.max_trip_in_conditions
      @min_trip_per_condition  = Condition.min_trip_in_conditions
    end
  end
end