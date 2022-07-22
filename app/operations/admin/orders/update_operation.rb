module Admin
  class Orders::UpdateOperation < ApplicationOperation
    attr_reader :order

    def initialize(params)
      @params = params
    end

    def perform
      load_order
      validation { return @errors}
      update_order
    end

    private

    def load_order
      @order = Order.find_by(id: params[:id])
    end

    def validation
      @form = Orders::UpdateForm.new(order_params)
      if @form.invalid?
        assignment_error
        yield
      end
    end

    def update_order
      @order.update order_params
    end
    
    def order_params
      params.require(:order).permit(:phone, :name, :address)
    end
  end
end
