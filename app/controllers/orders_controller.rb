class OrdersController < ApplicationController
  before_action :require_user

  def new
    @order = Order.new
  end

  def create
    order = Order.new(order_params)
    order.date_time = DateTime.now
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
    if (@order.user != current_user) && !current_admin
      render file: '/public/404'
    end
  end

  def update
    @order = Order.find(params[:id])
    @order.update(status: params[:status])
    @order.update(date_time: DateTime.now)
    redirect_to admin_dashboard_path
  end

  def destroy
  end

  private
    def order_params
      params.require(:order).permit(:status, :total, :purchaser_name, :address, :user_id)
    end

    def require_user
      render file: '/public/404' unless current_user || current_admin
    end
end
