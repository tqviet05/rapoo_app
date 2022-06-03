class ProductsController < ApplicationController
  def index
    @q = Product.ransack(params[:q])
    @products = @q.result.page(params[:page]).per(12)
    if current_user.present? 
      @current_cart = current_user.carts.last 
      @cart_items_count = @current_cart.cart_items.count
    end
  end

  def show
    @q = Product.ransack(params[:q])
    @product = Product.find_by(id: params[:id])
    if current_user.present? 
      @current_cart = current_user.carts.last 
      @cart_items_count = @current_cart.cart_items.count
    end
    # binding.pry

  end
end
