module Admin
  class Orders::DestroyOperation < ApplicationOperation
    def initialize(params)
      @params = params
    end

    def perform
      destroy_order
    end

    private

    def destroy_order
      Order.find(params[:id]).destroy!
    end
  end
end
