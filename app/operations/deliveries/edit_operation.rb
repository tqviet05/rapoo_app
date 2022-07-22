module Deliveries
  class EditOperation < ApplicationOperation
    attr_reader :delivery

    def initialize(params, current_user)
      @params = params
      @current_user = current_user
    end

    def perform
      load_delivery
    end

    private
    def load_delivery
    @delivery = current_user.deliveries.find(params[:id])
    end
  end
end
