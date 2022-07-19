class CategoriesController < ApplicationController
  def show
    operator = Categories::ShowOperation.new(params)
    operator.perform
    @categories = operator.categories
    @products = operator.products
  end
end
