class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    operator = CartItems::CreateOperation.new(params, current_user)
    operator.perform
    errors = operator.errors
    if errors.blank?
      redirect_back fallback_location: request.referrer, notice: 'Add cart success'
    else
      redirect_back fallback_location: request.referrer, alert: errors.full_messages.first
    end
  end

  def destroy
    current_cart.cart_items.find(params[:id]).destroy!
    redirect_to request.referrer || root_url
  end

  def update
    if cart_item_limit?
      current_cart
      @cart_item = current_cart.cart_items.find_or_create_by!(id: params[:id]) 
      if @cart_item.update(quantity: params[:cart_item][:quantity] )
        redirect_to request.referrer, notice: 'Add cart success' 
      else
        redirect_to request.referrer, alert: 'Add cart limit 50' 
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

  def cart_item_limit?
    current_cart.cart_items.count < 20 ? true : false
  end

  def build_cart_item
    cart_item = current_cart.cart_items.find_by(product_id: params[:pid])
    if cart_item.blank?
      current_cart.cart_items.create!(product_id: params[:pid], quantity: permit_params_quanlity)
    else
      cart_item.increment!(:quantity, permit_params_quanlity)
    end
  end

  def permit_params_quanlity
    (params[:quantity] || params[:cart_item][:quantity]).to_i
  end
end
