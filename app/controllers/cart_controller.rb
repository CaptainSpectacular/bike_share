class CartController < ApplicationController
  include ActionView::Helpers::TextHelper

  def index
    @accessories = @cart.contents.map do |accessory_id, count|
      Accessory.find(accessory_id.to_i)
    end

  end

  def create
    @accessory = Accessory.find(params[:accessory_id])
    @cart = Cart.new(session[:cart])

    if params[:value] == "add"
      @cart.add_accessory(@accessory)
      session[:cart] = @cart.contents
    else params[:value] == "subtract"
      @cart.remove_accessory(@accessory)
      session[:cart] = @cart.contents
    end

    flash[:success] = "You now have #{pluralize(@cart.accessory_count(@accessory.id.to_s), @accessory.title)} in your cart."
    redirect_to '/cart'
  end

  def destroy
    @accessory = Accessory.find(params[:accessory_id])
    @cart = Cart.new(session[:cart])
    @cart.delete_accessory(@accessory)
    session[:cart] = @cart.contents

    flash[:success] = "Successfully removed #{view_context.link_to(@accessory.title, @accessory)}.".html_safe
    redirect_to '/cart'
  end

end
