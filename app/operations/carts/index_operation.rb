module Carts
  class IndexOperation < ApplicationOperation
    attr_reader :total_money
    attr_reader :cart_items

    def initialize(params, current_user)
      @params = params
      @current_user = current_user
    end

    def perform
      load_cart_items
      update_total_money
    end

    private

    def load_cart_items
      Cart.find_or_create_by(user_id: current_user[:id])
      @cart_items = current_cart.cart_items.includes(:product).order(:id)
    end

    def update_total_money
      @total_money = @cart_items.sum {|cart_item| cart_item.product.price * cart_item.quantity }
      current_cart.update(total_money: @total_money)
    end

    def current_cart
      @current_cart ||= current_user.cart
    end
  end
end
