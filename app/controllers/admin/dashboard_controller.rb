module Admin
  class DashboardController < BaseController
    def index
      @orders = Order.all
      @sorted_orders = Order.by_status(params[:sort_status]) if params[:sort_status]
    end
  end
end
