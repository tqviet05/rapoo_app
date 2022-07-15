class OrderController < ApplicationController
  before_action :authenticate_user!
  before_action :current_cart! 

  def new
    @cart_items = current_cart.cart_items.includes(:product)
    @total  = @current_cart[:total_money]
    @deliveries = current_user.deliveries
    @deliveries_form = current_user.deliveries.build
  end

  def create
    current_delivery = current_user.deliveries.find_or_create_by(id: params[:delivery][:id])
    unless current_delivery.update(delivery_params)
      @cart_items = current_cart.cart_items.includes(:product)
      @total  = @current_cart[:total_money]
      @deliveries = current_user.deliveries
      @deliveries_form = current_delivery
      return render :new
    end
    @current_order =
      Order.find_or_create_by(
        user_id: current_user.id, 
        name: current_delivery.name, 
        phone: current_delivery.phone,
        address: current_delivery.address,
        cart_id: current_cart.id
      )  
    order_params(
      price: @current_cart.total_money,
      tax: 10
    )
    @current_order.update!(payment_params) if charger
    create_order_items 
    current_cart.destroy
    redirect_to histories_path, notice: 'Payment successful' 
  end
  
  private

  attr_reader :payment_params
  def create_order_items 
    current_cart.cart_items.includes(:product).each do |cart_item|
      @current_order.order_items.create!(
        quantity: cart_item.quantity, 
        product_id: cart_item.product_id, 
        price: cart_item.product.price,
      )
    end
  end

  def order_params price: 0.0, tax: 0.0, coupon: 0.0
    @payment_params = {
      payment: price*(1+tax/100.0) - price*(coupon/100.0),
      coupon: coupon,
      tax: tax,
      price: price
    }
  end


  def delivery_params
    params.require(:delivery).permit(:phone, :name, :address)
  end

  def charger
    # Set your secret key. Remember to switch to your live secret key in production.
    # See your keys here: https://dashboard.stripe.com/apikeys
    Stripe.api_key = 'sk_test_51LBVAAJwzajPifAPzQ0gdjYEwLrZUxHbpeEosWsOk9nwkrRYhm4rcI7P4jI4EfJ3rKYTCE1OwdmMEXvXUZ7SU2Rw009JiufXaO'

    # Token is created using Stripe Checkout or Elements!
    # Get the payment token ID submitted by the form:
    token = params[:delivery][:stripe_token]

    charge = Stripe::Charge.create({
      amount: payment_params[:payment].to_i,
      currency: 'vnd',
      description: 'Rapoo app',
      source: token,
    })
  end
  def current_cart!
    redirect_to root_path , alert: ' Your needs add product into cart' if current_cart.blank?
  end
end
