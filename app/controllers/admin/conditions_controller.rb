module Admin
  class ConditionsController < BaseController
    def new
      @condition = Condition.new
    end

    def create
      @condition = Condition.new(condition_params)
      if @condition.save
        flash[:success] = 'Condition successfully created.'
        redirect_to @condition
      else
        flash.now[:danger] = 'Something went wrong. Please try again.'
        render :new
      end
    end

    def edit
    end

    private

    def condition_params
      params.require(:condition).permit(:date,
                                        :max_temp,
                                        :average_temp,
                                        :min_temp,
                                        :average_visibility,
                                        :average_humidity,
                                        :precipitation,
                                        :average_windspeed)
                                        
    end
  end
end