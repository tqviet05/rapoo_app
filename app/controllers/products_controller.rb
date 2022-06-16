class ProductsController < ApplicationController
  def index
    @products = build_ransack.result.page(params[:page]).per(12)
  end

  def show
    @product = Product.find_by(id: params[:id])
    @product_attachments = @product.product_attachments
    if cookies.signed[:recently_product_ids].blank?
      cookies.signed[:recently_product_ids] = [@product.id]
    else
      current_cookies = cookies.signed[:recently_product_ids]
      current_cookies << @product.id
      cookies.signed[:recently_product_ids] = current_cookies.uniq
    end
  end
end
