module Deliveries
  class DestroyOperation < ApplicationOperation
    attr_reader :delivery

    def initialize(params)
      @params = params
    end

    def perform
      destroy_deliveries
    end

    private
    def destroy_deliveries
    Delivery.find(params[:id]).destroy!
    end
  end
end
