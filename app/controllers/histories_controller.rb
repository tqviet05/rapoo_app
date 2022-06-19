class HistoriesController < ApplicationController
  def index
    @or = current_user.orders.order(id: :desc).includes(order_items: :product).ransack(params[:query])
    @orders = @or.result.page(params[:page]).per(4)
  end
end
