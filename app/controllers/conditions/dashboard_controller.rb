module Conditions
  class DashboardController < ApplicationController
    def index
      @avg_trips_per_condition = Condition.avg_trips_with_condition(50..60)
    end
  end
end