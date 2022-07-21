module Admin
  class Orders::IndexOperation < ApplicationOperation
    attr_reader :orders
    attr_reader :q

    def initialize(params)
      @params = params
    end

    def perform
      load_query
      load_orders
    end

    private

    def load_query
      @q = Order.all.order(:id).ransack(params[:q])
    end

    def load_orders
      @orders = @q.result.page(params[:page]).per(20)
    end
  end
end
