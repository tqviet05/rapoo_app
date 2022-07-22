module Users
  class OrderOperation < ApplicationOperation
    attr_reader :orders
    def initialize(current_user, params)
      @current_user = current_user
      @params = params
    end

    def perform
      load_orders
    end

    private

    def load_orders
    @orders = current_user.orders.order(id: :desc).includes(:order_items).page(params[:page]).per(2)
    end

    def user_params
      params.require(:user).permit(:phone, :name, :address, :gender, :birthday)
    end
  end
end
