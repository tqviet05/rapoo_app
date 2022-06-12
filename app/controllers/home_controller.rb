class HomeController < ApplicationController
  def index
    @categories = Category.all
    @products = build_ransack.result.page(params[:page]).per(12)
  end
end
