class OrderItemsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def create
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
  end
end