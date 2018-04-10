class CartController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    accessory = Accessory.find(params[:accessory_id])
    @cart = Cart.new(session[:cart])
    @cart.add_accessory(accessory)
    session[:cart] = @cart.contents
    flash[:notice] = "You now have #{pluralize(@cart.accessory_count(accessory.id.to_s), accessory.title)} in your cart."
    redirect_to '/bike-shop'
  end
end
