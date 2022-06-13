class DeliveriesController < ApplicationController
  def index
    @deliveries = current_user.deliveries
  end

  def new
  end

  def show
  end
end
