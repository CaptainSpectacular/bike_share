class TripsDashboardPresenter

  def best_weather
    Trip.best_weather
  end

  def worst_weather
    Trip.worst_weather
  end

  def avg_duration
    Trip.average_duration
  end

  def min_duration
    Trip.min_duration
  end

  def max_duration
    Trip.max_duration
  end

  # def trips_by_month
  #   Trip.beautify_group_by_month
  # end

  def popular_starting_station
    Trip.popular_starting_station
  end

  def popular_ending_station
    Trip.popular_ending_station
  end

  def popular_bike
    Trip.popular_bike
  end

  def unpopular_bike
    Trip.unpopular_bike
  end

  def customer_breakdown
    Trip.subscribtion_breakdown('Customer')
  end

  def subscriber_breakdown
    Trip.subscribtion_breakdown('Subscriber')
  end

  def busy_date
    Trip.busy_date
  end

  def dead_date
    Trip.dead_date
  end

  def group_month
    Trip.group_by_month.map do |month, rides|
      [month.strftime('%B - %Y'), rides]
    end
  end
end