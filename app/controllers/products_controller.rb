class ProductsController < ApplicationController
  def index
    @q = Product.ransack(params[:q])
    @products = @q.result.page(params[:page]).per(12)
  end

  def show
    @q = Product.ransack(params[:q])
    @product = Product.find_by(id: params[:id])
    # binding.pry

  end
end
