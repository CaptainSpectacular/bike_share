module Stations
  class DashboardController < ApplicationController
    def index
      @total_stations = Station.all.size
      @average_bikes = Station.average_bikes
      @most_docks = Station.most_docks
      @least_docks = Station.least_docks
      @max_docks = Station.max_docks
      @min_docks = Station.min_docks
      @oldest = Station.oldest
      @newest = Station.newest
    end
  end
end