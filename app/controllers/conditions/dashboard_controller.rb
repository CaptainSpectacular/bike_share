module Conditions
  class DashboardController < ApplicationController
    def index
      @avg_trips_per_condition = Condition.average_trips_in_conditions
    end
  end
end