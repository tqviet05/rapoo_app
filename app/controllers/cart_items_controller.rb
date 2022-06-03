class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    cart = current_user.carts.find_or_create_by(user_id: current_user.id)
    @cart_item = CartItem.new do |c|
      c.product_id = params[:pid]
      c.cart_id = cart.id
      c.quantity = 1
    end
    @cart_item.save
    redirect_to root_path
  end
end
