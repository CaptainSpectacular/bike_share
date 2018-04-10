module Admin
  class StationsController < BaseController
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

    def edit
      @station = Station.friendly.find(params[:id])
    end

    def update
      @station = Station.friendly.find(params[:id])
      @station.update(station_params)
      if @station.save
        flash[:success] = "#{@station.name} was updated!"
        redirect_to station_path(@station)
      else
        render :edit
      end
    end

    def destroy
      station = Station.friendly.find(params[:id])
      station.destroy
      flash[:notice] = "#{station.name} was deleted!"
      redirect_to stations_path
    end

    private
    def station_params
      params.require(:station).permit(:name, :dock_count, :city, :installation_date)
    end

  end
end
