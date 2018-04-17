module Trips
  class DashboardController < ApplicationController
    def index
      @presenter = TripsDashboardPresenter.new
    end
  end
end
