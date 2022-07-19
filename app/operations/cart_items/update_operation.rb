module CartItems
  class UpdateOperation < ApplicationOperation
    def initialize(params, current_user)
      @params = params
      @current_user = current_user
    end

    def perform
      current_cart
      validation { return @errors}
      build_cart_item
    end

    private


    def validation
      @form = CartItems::UpdateForm.new(permit_params)
      if @form.invalid?
        assignment_error
        yield
      end
    end

    def build_cart_item
      @cart_item = current_cart.cart_items.find_or_create_by!(id: params[:id]) 
      @cart_item.update(quantity: params[:cart_item][:quantity])
    end

    def current_cart
      @current_cart ||= current_user.cart
    end

    def permit_params
      params.require(:cart_item).permit(:quantity)
    end
  end
end
