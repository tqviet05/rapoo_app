class OrderController < ApplicationController
  def index
    @q = Product.ransack(params[:q])
    @cart_items_count = current_cart.cart_items.count if current_user.present? 
    binding.pry

  end

  def new
    @q = Product.ransack(params[:q])
    @cart_items_count = current_cart.cart_items.count if current_user.present? 
    @cart_items = current_cart.cart_items.includes(:product)
    @total  = @current_cart[:total_money]
    @deliveries = current_user.deliveries
    @deliveries_form = current_user.deliveries.build
    # binding.pry
    # @cart_items.each do |item|
    #   quantity = item.quantity
    #   price = item.product.price
    #   @total += quantity * price
    # end
    # @current_cart.update(total_money: @total)
  end

  def create
    binding.pry
  end
  
  private 

  def current_cart
    @current_cart ||= current_user.cart
  end
end
