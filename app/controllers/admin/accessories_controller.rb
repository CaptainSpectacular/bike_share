module Admin
  class AccessoriesController < BaseController

    def create
      @accessory = Accessory.new(accessory_params)
      if @accessory.save
        flash[:success] = "You have created #{@accessory.title}!"
        redirect_to bike_shop_path
      else
        render :'admin/bike_shop/new'
      end
    end

    def edit
      @accessory = Accessory.find(params[:id])
    end

    def update
      @accessory = Accessory.find(params[:id])
      @accessory.update(accessory_params)
      if @accessory.save
        flash[:success] = "#{@accessory.title} was updated!"
        redirect_to accessory_path(@accessory)
      else
        render :edit
      end
    end

    def destroy
      accessory = Accessory.destroy(params[:id])
      flash[:success] = "#{accessory.title} was deleted!"
      redirect_to bike_shop_path
    end

    private
    def accessory_params
      params.require(:accessory).permit(:title, :description, :price, :image, :category_id, :status)
    end

  end
end
