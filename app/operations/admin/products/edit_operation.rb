class Admin::Products::EditOperation < ApplicationOperation
  attr_reader :product, :product_attachments

  def initialize(params)
    @params = params
  end

  def perform
    load_product
    build_product_attachments
  end

  private

  def load_product
    @product = Product.find_by(id: params[:id])
  end

  def build_product_attachments
    @product_attachments = @product.product_attachments.build
  end
end
