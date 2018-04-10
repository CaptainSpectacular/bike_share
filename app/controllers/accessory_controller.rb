class AccessoryController < ApplicationController
  def show
    @accessory = Accessory.find(params[:id])
  end
end
