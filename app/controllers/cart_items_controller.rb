class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    Cart.find_or_create_by!(user_id: current_user.id)
    if cart_item_unlimit?
      build_cart_item
      redirect_to cart_index_path, notice: 'Add cart success' 
    else
      redirect_to root_path, alert: 'Cart is fully'
    end
  rescue => e
    redirect_to root_path, alert: 'Add cart failed'
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

  def cart_item_unlimit?
    current_cart.cart_items.count < 20 ? true : false
  end

  def build_cart_item
    cart_item = current_cart.cart_items.find_by(product_id: params[:pid])
    if cart_item.blank?
      current_cart.cart_items.create!(product_id: params[:pid], quantity: 1)
    else
      cart_item.increment!(:quantity, permit_params_quanlity)
    end
  end

  def permit_params_quanlity
    (params[:quantity] || params[:cart_item][:quantity]).to_i
  end
end
