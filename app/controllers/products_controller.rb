class ProductsController < ApplicationController
  def index
    @products = build_ransack.result.page(params[:page]).per(12)
  end

  def show
    @product = Product.find_by(id: params[:id])
  end
end
