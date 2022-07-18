class CartController < ApplicationController
  before_action :authenticate_user!
  def index
    operator = Carts::IndexOperation.new(params, current_user)
    operator.perform
    @cart_items = operator.cart_items
    @total = operator.total_money
  end
end
