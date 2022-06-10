class OrderItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @q = Product.ransack(params[:q])

  end

  def create
    @q = Product.ransack(params[:q])
    @cart_items_count = current_cart.cart_items.count if current_user.present? 
    # current_cart.order.destroy if current_cart.order.present?
    # binding.pry
    order = current_cart.order || current_cart.create_order
    order_items = current_cart.cart_items.includes(:product).map do |cart_item|
      {
        quantity: cart_item.quantity, 
        product_id: cart_item.product_id, 
        price: cart_item.product.price,
        created_at: Time.now.utc,
        updated_at: Time.now.utc
      }
    end
    order.order_items.insert_all(order_items)
    order_items.each do |item|

    end

  end
end

private

  def current_cart
    @current_cart ||= current_user.cart
  end

  def current_order
    @current_order ||= current_cart.order
  end