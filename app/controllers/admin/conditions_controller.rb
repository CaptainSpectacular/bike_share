module Admin
  class ConditionsController < BaseController
    before_action :set_condition, only: %i[edit update destroy]
    def new
      @condition = Condition.new
    end

    def create
      @condition = Condition.new(condition_params)
      if @condition.save
        flash[:success] = "Your condition from #{@condition.date} was created!"
        redirect_to @condition
      else
        flash.now[:danger] = 'Something went wrong. Please try again.'
        render :new
      end
    end

    def edit
    end

    def update
      if @condition.update(condition_params)
        flash[:success] = "Your condition from #{@condition.date} was updated!"
        redirect_to @condition
      else
        flash.now[:danger] = 'Something went wrong. Please try again.'
        render :edit
      end
    end

    def destroy
      @condition.delete
      flash[:success] = "Your condition from #{@condition.date} was deleted!"
      redirect_to conditions_path
    end

    private

    def set_condition
      @condition = Condition.find(params[:id])
    end

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
