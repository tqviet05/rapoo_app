class HistoriesController < ApplicationController
  def index
    @orders = current_user.orders.order(id: :desc).includes(:order_items).page(params[:page]).per(12)
  end
end
