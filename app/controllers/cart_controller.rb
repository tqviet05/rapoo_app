class CartController < ApplicationController
  before_action :authenticate_user!
  def index
    @q = Product.ransack(params[:q])
    @cart_items_count = current_cart.cart_items.count if current_user.present? 
    @cart_items = current_cart.cart_items
    @total  = 0
    @cart_items.each do |item|
      quantity = item.quantity
      price = item.product.price
      @total += quantity * price
    end
  end

  def create

  end

  private 

  def current_cart
    @current_cart ||= current_user.cart
  end
end
