module Deliveries
  class NewOperation < ApplicationOperation
    attr_reader :delivery

    def initialize(params, current_user)
      @params = params
      @current_user = current_user
    end

    def perform
      build_deliveries
    end

    private
    def build_deliveries
      @delivery = current_user.deliveries.build
    end
  end
end
