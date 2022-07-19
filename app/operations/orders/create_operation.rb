module Orders
  class CreateOperation < ApplicationOperation
    attr_reader :delivery, :cart_items, :deliveries, :deliveries_form
    attr_reader :current_order
    def initialize(current_cart, current_user, params)
      @params = params
      @current_cart = current_cart
      @current_user = current_user
    end

    def perform
      load_delivery
      load_cart_items
      load_deliveries
      build_deliveries_form
      validation_deliveries { return @errors}
      update_delivery
      load_current_order
      update_current_order
      # validation_order_items{ return @errors}
      create_order_items
      destroy_current_cart
    end

    private

    def load_delivery
      @current_delivery = @current_user.deliveries.find_or_create_by(id: @params[:delivery][:id])
    end

    def validation_deliveries
      @form = Deliveries::UpdateForm.new(permit_params)
      if @form.invalid?
        assignment_error
        yield
      end
    end

    # def validation_deliveries
    #   @form = OrderItems::CreateForm.new(order_id: @current_order, product_id:@cart)
    #   if @form.invalid?
    #     assignment_error
    #     yield
    #   end
    # end

    def update_delivery
      @current_delivery.update(permit_params)
    end

    def load_cart_items
      @cart_items = @current_cart.cart_items.includes(:product)
    end

    def load_deliveries
      @deliveries = @current_user.deliveries
    end

    def build_deliveries_form
      @deliveries_form = @current_user.deliveries.build
    end

    def load_current_order
    @current_order =
      Order.find_or_create_by(
        user_id: @current_user.id, 
        name: @current_delivery.name, 
        phone: @current_delivery.phone,
        address: @current_delivery.address,
        cart_id: @current_cart.id
      )  
    end
    
    def update_current_order
      order_params(price: @current_cart.total_money, tax: 10)
      @current_order.update!(@payment_params) if charger
    end

    def order_params price: 0.0, tax: 0.0, coupon: 0.0
      @payment_params = {
        payment: price*(1+tax/100.0) - price*(coupon/100.0),
        coupon: coupon,
        tax: tax,
        price: price
      }
    end

    def create_order_items 
      @current_cart.cart_items.includes(:product).each do |cart_item|
        @current_order.order_items.create!(
          quantity: cart_item.quantity, 
          product_id: cart_item.product_id, 
          price: cart_item.product.price,
        )
      end
    end

    def destroy_current_cart
      @current_cart.destroy
    end

    def charger
      # Set your secret key. Remember to switch to your live secret key in production.
      # See your keys here: https://dashboard.stripe.com/apikeys
      Stripe.api_key = 'sk_test_51LBVAAJwzajPifAPzQ0gdjYEwLrZUxHbpeEosWsOk9nwkrRYhm4rcI7P4jI4EfJ3rKYTCE1OwdmMEXvXUZ7SU2Rw009JiufXaO'
  
      # Token is created using Stripe Checkout or Elements!
      # Get the payment token ID submitted by the form:
      token = @params[:delivery][:stripe_token]
  
      charge = Stripe::Charge.create({
        amount: @payment_params[:payment].to_i,
        currency: 'vnd',
        description: 'Rapoo app',
        source: token,
      })
    end
    def permit_params
      @params.require(:delivery).permit(:phone, :name, :address)
    end
  end
end
