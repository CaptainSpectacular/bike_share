class StationsDashboardPresenter
  def total_stations
    Station.all.size
  end

  def average_bikes
    Station.average_bikes
  end

  def most_docks
    Station.most_docks
  end

  def least_docks
    Station.least_docks
  end

  def max_docks
    Station.max_docks
  end

  def min_docks
    Station.min_docks
  end

  def oldest
    Station.oldest
  end

  def newest
    Station.newest
  end
end
