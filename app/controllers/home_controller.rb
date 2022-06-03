class HomeController < ApplicationController
  def index
    @categories = Category.all
    @q = Product.ransack(params[:q])
    @products = @q.result.page(params[:page]).per(12)
    if current_user.present? 
      @current_cart = current_user.carts.last 
      @cart_items_count = @current_cart.cart_items.count
    end
    # binding.pry
  end

  def show
    
  end

  def update

  end
end
