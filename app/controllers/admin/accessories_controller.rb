module Admin
  class AccessoriesController < BaseController

    def create
      @accessory = Accessory.new(accessory_params)
      if @accessory.save
        flash[:notice] = "You have created #{@accessory.title}!"
        redirect_to bike_shop_path
      else
        render :'admin/bike_shop/new'
      end
    end

    private
    def accessory_params
      params.require(:accessory).permit(:title, :description, :price, :image, :status)
    end

  end
end
