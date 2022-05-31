class ProductsController < ApplicationController
  def index
    @q = Product.ransack(params[:q])
    @products = @q.result.page(params[:page]).per(12)
  end

  def show
    # binding.pry
    @q = Product.ransack(params[:q])
  end
end
