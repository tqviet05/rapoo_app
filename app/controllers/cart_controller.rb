class CartController < ApplicationController
  before_action :authenticate_user!
  def index
    Cart.find_or_create_by(user_id: current_user[:id])

    @cart_items = current_cart.cart_items.includes(:product).order(:id)
    @total  = 0
    @cart_items.each do |item|
      quantity = item.quantity
      price = item.product.price
      @total += quantity * price
    end
    @current_cart.update(total_money: @total)

  end
  

  private 

  def current_cart
    @current_cart ||= current_user.cart
  end
end
