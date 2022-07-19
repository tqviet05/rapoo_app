module Deliveries
  class IndexOperation < ApplicationOperation
    attr_reader :deliveries

    def initialize(params, current_user)
      @params = params
      @current_user = current_user
    end

    def perform
      load_deliveries
    end

    private
    def load_deliveries
    @deliveries = current_user.deliveries.page(params[:page]).per(4)
    end
  end
end
