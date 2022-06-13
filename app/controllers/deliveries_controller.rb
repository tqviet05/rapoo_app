class DeliveriesController < ApplicationController
  def index
    @query = current_user.deliveries.ransack(params[:query])
    @deliveries = @query.result.page(params[:page]).per(4)
  end
end
