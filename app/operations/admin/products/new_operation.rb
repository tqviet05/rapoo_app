class Admin::Products::NewOperation < ApplicationOperation
  attr_reader :product_attachments, :product


  def perform
    build_product
    build_product_attachments
  end

  private

  def build_product
    @product = Product.new
  end

  def build_product_attachments
    @product_attachments = @product.product_attachments.build
  end
end
