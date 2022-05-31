class HomeController < ApplicationController
  def index
    @categories = Category.all
    @q = Product.ransack(params[:q])
    @products = @q.result.page(params[:page]).per(12)
  end

  def show
    
  end

  def update

  end
end
