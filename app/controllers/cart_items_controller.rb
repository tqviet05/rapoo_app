class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    # create a new cart
    current_cart
    # create a new or find cart items
    @cart_item = current_cart.cart_items.find_or_create_by(product_id: params[:pid]) 
    # update quantity cart items
    @cart_item.quantity == nil ? @cart_item.quantity =1 : @cart_item.quantity +=1
    @cart_item.save
    redirect_to root_path
  end

  def destroy
    current_cart.cart_items.find(params[:id]).destroy!
    redirect_to cart_index_path
  end

private

  def current_cart
    @current_cart ||= current_user.cart
  end
end
