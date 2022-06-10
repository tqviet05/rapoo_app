class HomeController < ApplicationController
  def index
    @categories = Category.all
    @q = Product.ransack(params[:q])
    @products = @q.result.page(params[:page]).per(12)
    @cart_items_count = current_cart.cart_items.count if current_user.present? && current_cart.present?
  end

  def show
    @q = Product.ransack(params[:q])
    @cart_items_count = current_cart.cart_items.count if current_user.present? && current_cart.present?
    
  end

  def update

  end

  private 

  def current_cart
    @current_cart ||= current_user.cart
  end

end
