module Admin
  class BikeShopController < BaseController
    def index
      @accessories = Accessory.all
    end

    def new
      @accessory = Accessory.new
    end
  end
end
