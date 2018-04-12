class OrdersController < ApplicationController
  def new
  end

  def create
<<<<<<< HEAD
    order = Order.new(order_params)
    order.date_time = DateTime.now
=======
    order = Order.new
    order.total = Accessory.find(order_params[:contents].keys.first.to_i).price * order_params[:contents].values.first.to_i
    order.date_time = DateTime.now
    order.status = order_params[:status]
>>>>>>> can add order with one accessory
    order.user_id = current_user.id
    if order.save
<<<<<<< HEAD
      session[:cart].each do |order_object|
        OrderAccessory.create!(accessory_id: order_object[0], order_id: order.id, quantity: order_object[1])
      end
=======
>>>>>>> can add order with one accessory
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
      params.require(:order).permit(:status, :total)
=======

>>>>>>> current order behavior
=======
      content_keys = params[:order][:contents].keys
      params.require(:order).permit(:status, contents: content_keys)
>>>>>>> can add order with one accessory
    end
end
