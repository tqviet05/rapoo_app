class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def create
      Cart.find_or_create_by(user_id: current_user[:id])
    # create a new cart
    if cart_item_limit!
      current_cart
      # create a new or find cart items
      @cart_item = current_cart.cart_items.find_or_create_by(product_id: params[:pid]) 
      # update quantity cart items
      @cart_item.quantity.blank? ? @cart_item.quantity =1 : @cart_item.quantity += params[:quantity].to_i
      @cart_item.save
      respond_to do |format|
        format.html { redirect_to request.referrer, notice: 'Add cart success' }
      end
      # redirect_to root_url
      # redirect_to request.referrer || root_url
    else
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'Cart is fully' }
      end
      # redirect_to root_url
    end
  end

  def destroy
    current_cart.cart_items.find(params[:id]).destroy!
    redirect_to request.referrer || root_url
  end

  def update
    if cart_item_limit!
      current_cart
      @cart_item = current_cart.cart_items.find_or_create_by!(id: params[:id]) 
      @cart_item.update!(quantity: params[:cart_item][:quantity] )
      respond_to do |format|
        format.html { redirect_to request.referrer, notice: 'Add cart success' }
      end
      # redirect_to request.referrer || root_url
    else
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'Cart is fully' }
      end
      # redirect_to root_url
    end
  end

private

  def current_cart
    @current_cart ||= current_user.cart
  end

  def cart_item_limit!
    current_cart.cart_items.count < 20 ? true : false
  end
end
