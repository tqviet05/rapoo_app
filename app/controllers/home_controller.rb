class HomeController < ApplicationController
  def index
    @categories = Category.all
    @q = Product.ransack(params[:q])
    @products = @q.result.page(params[:page]).per(12)
    @cart_items_count = current_cart.cart_items.count if current_user.present? 
  end

  def show
    
  end

  def update

  end

  private 

  def current_cart
    @current_cart ||= current_user.cart
    # .find_or_create_by(user_id: current_user.id)
    # @current_cart = current_user.cart.last 
  end

end
