module CartItems
  class CreateOperation < ApplicationOperation

    def initialize(params, current_user)
      @params = params
      @current_user = current_user
    end

    def perform
      load_cart
      validation { return @errors}
      build_cart_item
    end

    private

    def load_cart
      Cart.find_or_create_by(user_id: current_user.id)
    end

    def validation
      @form = CartItems::CreateForm.new(quantity: permit_params_quanlity, cart: current_cart.id)
      if @form.invalid?
        assignment_error
        yield
      end
    end

    def build_cart_item
      cart_item = current_cart.cart_items.find_by(product_id: params[:pid])
      if cart_item.blank?
        current_cart.cart_items.create!(product_id: params[:pid], quantity: permit_params_quanlity)
      else
        cart_item.increment!(:quantity, permit_params_quanlity)
      end
    end

    def current_cart
      @current_cart ||= current_user.cart
    end

    def permit_params_quanlity
      (params[:quantity] || params[:cart_item][:quantity]).to_i
    end

    # def cart_item_limit?
    #   current_cart.cart_items.count < 20 ? true : false
    # end
  end
end
