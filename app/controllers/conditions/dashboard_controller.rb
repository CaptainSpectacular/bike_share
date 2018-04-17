module Conditions
  class DashboardController < ApplicationController
    def index
      @presenter = ConditionsDashboardPresenter.new
    end
  end
end