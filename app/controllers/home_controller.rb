class HomeController < ApplicationController
  def index
    @categories = Category.all
    @products = build_ransack.result.page(params[:page]).per(12)
    @recently_products = Product.where(id: cookies.signed[:recently_product_ids]) if cookies.signed[:recently_product_ids]
  end
end
