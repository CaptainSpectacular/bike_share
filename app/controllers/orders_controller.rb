class OrdersController < ApplicationController
  def new
  end

  def create
    order = Order.new(order_params)
    order.date_time = DateTime.now
    order.user_id = current_user.id
    if order.save
      session[:cart].each do |order_object|
        OrderAccessory.create!(accessory_id: order_object[0], order_id: order.id, quantity: order_object[1])
      end
      flash[:success] = "Successfully submitted your order totalling $#{order.total}"
      redirect_to dashboard_path
    else
      redirect_to cart_path
    end
  end

  def edit
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private
    def order_params
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
      params.require(:order).permit(:status, :total)
=======

>>>>>>> current order behavior
=======
      content_keys = params[:order][:contents].keys
      params.require(:order).permit(:status, contents: content_keys)
>>>>>>> can add order with one accessory
=======
      params.require(:order).permit(:status, :total)
>>>>>>> accessory order_quantity and order_subtotal methods
    end
end
