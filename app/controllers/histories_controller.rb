class HistoriesController < ApplicationController
  def index
    @or = current_user.orders.order(id: :desc).includes(:order_items).ransack(params[:query])
    @orders = @or.result.page(params[:page]).per(4)
  end
end
