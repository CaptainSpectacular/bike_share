module Conditions
  class DashboardController < ApplicationController
    def index
      @trip_temp_breakdown = Condition.trips_temp_breakdown

    end
  end
end