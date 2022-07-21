class Admin::Products::IndexOperation < ApplicationOperation
  attr_reader :products
  attr_reader :q

  def initialize(params)
    @params = params
  end

  def perform
    load_query
    load_products
  end

  private

  def load_query
    @q = Product.all.includes(:category).includes(:product_attachments).ransack(params[:q])
  end

  def load_products
    @products = @q.result.page(params[:page]).per(20)
  end
end
