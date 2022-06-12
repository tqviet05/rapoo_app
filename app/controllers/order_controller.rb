class OrderController < ApplicationController
  before_action :authenticate_user!

  def new
    @cart_items = current_cart.cart_items.includes(:product)
    @total  = @current_cart[:total_money]
    @deliveries = current_user.deliveries
    @deliveries_form = current_user.deliveries.build
  end

  def create
    # chua validate form nil, model trung records
    # tao delivery
    current_delivery = current_user.deliveries.find_or_create_by(id: params[:delivery][:id])
    current_delivery.update!(delivery_params)
    current_order = 
      Order.find_or_create_by(
        user_id: current_user.id, 
        name: current_delivery.name, 
        phone: current_delivery.phone,
        address: current_delivery.address,
        cart_id: current_cart.id
      )
    price = @current_cart.total_money
    tax = 10
    coupon = 0
    payment = price*(1+tax/100) - price*(coupon/100)
    current_order.update!(price: price, coupon: coupon, payment: payment, tax: tax)

    current_cart.cart_items.includes(:product).each do |cart_item|
      current_order.order_items.create!(
        quantity: cart_item.quantity, 
        product_id: cart_item.product_id, 
        price: cart_item.product.price,
      )
    end
    
    current_cart.destroy

    respond_to do |format|
      format.html { redirect_to histories_path, notice: 'Payment successful' }
    end
  end
  
  private 

  def delivery_params
    params.require(:delivery).permit(:phone, :name, :address)
  end
end
