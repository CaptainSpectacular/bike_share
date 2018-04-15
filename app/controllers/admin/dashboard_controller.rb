module Admin
  class DashboardController < BaseController
    def index
      @orders = Order.all
    end
  end
end
