module Admin
  class BikeShopController < BaseController
    def index
      @accessories = Accessory.all
    end
  end
end
