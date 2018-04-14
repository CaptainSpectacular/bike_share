class OrdersController < ApplicationController
  before_action :require_user

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
      session[:cart] = nil
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
      params.require(:order).permit(:status, :total)
    end

    def require_user
      require file: '/public/404' unless current_user
    end
end
