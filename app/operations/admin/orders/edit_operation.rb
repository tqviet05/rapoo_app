module Admin
  class Orders::EditOperation < ApplicationOperation
    attr_reader :order

    def initialize(params)
      @params = params
    end

    def perform
      load_order
    end

    private

    def load_order
      @order = Order.find_by(id: params[:id])
    end
  end
end
