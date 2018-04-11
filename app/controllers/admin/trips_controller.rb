module Admin
  class TripsController < BaseController
    before_action :set_trip, only: [:edit, :update, :destroy]

    def new
      @trip = Trip.new
      @stations = Station.all
    end

    def create
      trip = Trip.new(trip_params)
      trip[:start_station_name] = Station.find(params[:trip][:start_station_id]).name
      trip[:end_station_name] = Station.find(params[:trip][:end_station_id]).name
      if trip.save
        flash[:success] = "Your trip from #{trip.start_date} has been created!"
        redirect_to trip_path(trip)
      else
        render :new
      end
    end

    def edit
      @stations = Station.all
    end

    def update
      @trip.update(trip_params)
      @trip[:start_station_name] = Station.find(params[:trip][:start_station_id]).name
      @trip[:end_station_name] = Station.find(params[:trip][:end_station_id]).name
      if @trip.save
        flash[:success] = "Your trip from #{@trip.start_date} was updated!"
        redirect_to trip_path(@trip)
      else
        render :edit
      end
    end

    def destroy
      @trip.delete
      flash[:success] = 'Trip successfully deleted.'
      redirect_to trips_path
    end

    private
    def set_trip
      @trip = Trip.find(params[:id])
    end

    def trip_params
      params.require(:trip).permit(:duration, :start_date, :end_date, :start_station_id, :start_station_name, :end_station_id, :end_station_name, :bike_id, :subscription_type, :zip_code)
    end

  end
end
