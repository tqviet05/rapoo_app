class CategoriesController < ApplicationController
  def show
    @categories = Category.all
    @q = Product.ransack(params[:q])
    @products = Category.find_by!(id: params[:id]).products.page(params[:page]).per(12)
    @cart_items_count = current_cart.cart_items.count if current_user.present? 

  end
  private 

  def current_cart
    @current_cart ||= current_user.cart
  end
end
