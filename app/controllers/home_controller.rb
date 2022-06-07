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
  end

end
