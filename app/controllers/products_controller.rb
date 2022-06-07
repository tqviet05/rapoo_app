class ProductsController < ApplicationController
  def index
    @q = Product.ransack(params[:q])
    @products = @q.result.page(params[:page]).per(12)
    @cart_items_count = current_cart.cart_items.count if current_user.present? 
  end

  def show
    @q = Product.ransack(params[:q])
    @product = Product.find_by(id: params[:id])
    # tao doi tuong cart_item cho form_for add cart
    @cart_item = current_cart.cart_items.find_or_initialize_by(product_id: params[:id]) 
    @cart_items_count = current_cart.cart_items.count if current_user.present? 
  end

  private 

  def current_cart
    @current_cart ||= current_user.cart
  end
end
