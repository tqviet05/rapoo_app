class HistoriesController < ApplicationController
  def index
    @q = Product.ransack(params[:q])
    @cart_items_count = current_cart.cart_items.count if current_user.present?  rescue 0
    @orders = current_user.orders.order(id: :desc).includes(:order_items).page(params[:page]).per(12)
  end

  private 

  def current_cart
    @current_cart ||= current_user.cart
  end
  
end
