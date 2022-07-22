module CartItems
  class DestroyOperation < ApplicationOperation
    def initialize(params, current_user)
      @params = params
      @current_user = current_user
    end

    def perform
      destroy_cart_item
    end

    private

    def destroy_cart_item
      current_cart.cart_items.find(params[:id]).destroy!
    end

    def current_cart
      @current_cart ||= current_user.cart
    end
  end
end
