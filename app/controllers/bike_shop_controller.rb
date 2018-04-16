class BikeShopController < ApplicationController
  def index
    @accessories = Accessory.location(params)
  end
end
