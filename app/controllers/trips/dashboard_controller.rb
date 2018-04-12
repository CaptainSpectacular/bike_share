module Trips
  class DashboardController < ApplicationController
    def index
      @best_weather  = Trip.best_weather
      @worst_weather = Trip.worst_weather
    end
  end
end
