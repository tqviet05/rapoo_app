class CategoriesController < ApplicationController
  def show
    @categories = Category.all
    @products = Category.find_by!(id: params[:id]).products.page(params[:page]).per(12)
  end
end
