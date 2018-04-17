class ConditionsDashboardPresenter
  def trip_temp_breakdown
    Condition.trips_temp_breakdown
  end

  def trip_pre_breakdown
    Condition.trips_precipitation_breakdown
  end

  def trip_wind_breakdown
    Condition.trips_windspeed_breakdown
  end

  def trip_visible_breakdown
    Condition.trips_visibility_breakdown
  end
end
