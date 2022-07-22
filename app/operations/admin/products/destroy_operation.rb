class Admin::Products::DestroyOperation < ApplicationOperation
  def initialize(params)
    @params = params
  end

  def perform
    destroy_product
  end

  private

  def destroy_product
    Product.find(params[:id]).destroy!
  end
end
