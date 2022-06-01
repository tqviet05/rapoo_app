class CategoriesController < ApplicationController
  def show
    @categories = Category.all
    @q = Product.ransack(params[:q])
    @products = Category.find_by(id: params[:id]).products.page(params[:page]).per(12)
  end

end
