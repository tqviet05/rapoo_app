module Histories
  class IndexOperation < ApplicationOperation
    attr_reader :orders

    def initialize(params, current_user)
      @params = params
      @current_user = current_user
    end

    def perform
      load_orders
    end

    private
    def load_orders
      binding.pry
    @orders = current_user.orders.order(id: :desc).includes(order_items: :product).page(params[:page]).per(4)
    end
  end
end
