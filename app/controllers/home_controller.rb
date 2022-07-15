class HomeController < ApplicationController

  def index
    operator = Home::IndexOperation.new(params, current_user, recently_product_ids)
    operator.perform
    @categories = operator.categories
    @banners = operator.banners
    @products = operator.products
    @recently_products = operator.recently_products
  end
end
