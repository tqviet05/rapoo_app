class ProductsController < ApplicationController
  def index
    operator = Products::IndexOperation.new(params)
    operator.perform
    @products = operator.products
  end

  def show
    operator = Products::ShowOperation.new(params, recently_product_ids)
    operator.perform
    @product = operator.product
    @product_attachments = operator.product_attachments
    cookies.signed[:recently_product_ids] = operator.recently_product_ids
  end
end
