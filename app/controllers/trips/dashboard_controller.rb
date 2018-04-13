module Trips
  class DashboardController < ApplicationController
    def index
      @best_weather  = Trip.best_weather
      @worst_weather = Trip.worst_weather
      @avg_duration = Trip.average_duration
      @min_duration = Trip.min_duration
      @max_duration = Trip.max_duration
      @trips_by_month = Trip.beautify_group_by_month
      @popular_starting_station = Trip.popular_starting_station
      @popular_ending_station = Trip.popular_ending_station
      @popular_bike = Trip.popular_bike
      @unpopular_bike = Trip.unpopular_bike
      @customer_breakdown = Trip.subscribtion_breakdown('Customer')
      @subscriber_breakdown = Trip.subscribtion_breakdown('Subscriber')
      @busy_date = Trip.busy_date
      @dead_date = Trip.dead_date
    end
  end
end
