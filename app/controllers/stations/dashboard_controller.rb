module Stations
  class DashboardController < ApplicationController
    def index
      @presenter = StationsDashboardPresenter.new
    end
  end
end