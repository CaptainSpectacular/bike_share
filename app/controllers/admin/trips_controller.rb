module Admin
  class TripsController < BaseController
    def new
      @trip = Trip.new
      @stations = Station.all
    end

    def show
    end

    def create
    end

    def update
    end

  end
end
