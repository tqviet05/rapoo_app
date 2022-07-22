module Orders
  class NewOperation < ApplicationOperation
    attr_reader :cart_items, :deliveries, :deliveries_form

    def initialize(current_cart, current_user)
      @current_cart = current_cart
      @current_user = current_user
    end

    def perform
      load_cart_items
      load_deliveries
      build_deliveries_form
    end

    private

    def load_cart_items
      @cart_items = @current_cart.cart_items.includes(:product)
    end

    def load_deliveries
      @deliveries = @current_user.deliveries
    end

    def build_deliveries_form
      @deliveries_form = @current_user.deliveries.build
    end
  end
end
