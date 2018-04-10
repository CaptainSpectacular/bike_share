class CartController < ApplicationController
  include ActionView::Helpers::TextHelper

  def index
    @accessories = @cart.contents.map do |accessory_id, count|
      Accessory.find(accessory_id.to_i)
    end
  end

  def create
    accessory = Accessory.find(params[:accessory_id])
    @cart = Cart.new(session[:cart])
    @cart.add_accessory(accessory)
    session[:cart] = @cart.contents
    flash[:notice] = "You now have #{pluralize(@cart.accessory_count(accessory.id.to_s), accessory.title)} in your cart."
    redirect_to '/bike-shop'
  end
end
