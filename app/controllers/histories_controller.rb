class HistoriesController < ApplicationController
  def index
    operator = Histories::IndexOperation.new(params, current_user)
    operator.perform
    @orders = operator.orders
  end
end
