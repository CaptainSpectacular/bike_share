class StationsController < ApplicationController
  def index
    @stations = Station.all
  end

  def new
    @station = Station.new
  end

  def create
    station = Station.new(station_params)
    if station.save
      flash[:success] = "#{station.name} has been created!"
      redirect_to station_path(station)
    else
      render :new
    end
  end

  def show
    @station = Station.friendly.find(params[:id])
  end

  private
  def station_params
    params.require(:station).permit(:name, :dock_count, :city, :installation_date)
  end
end
