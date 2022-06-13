class HomeController < ApplicationController
  def index
    @categories = Category.all
    @products = build_ransack.result.page(params[:page]).per(12)
    if current_user
      build_recently_products_user
      product_id_rencently = current_user.recently_products.map { |i| i.product_id}
      cookies.delete :recently_product_ids
      @recently_products = Product.where(id: product_id_rencently).order(updated_at: :desc).take(6)
    else
      @recently_products = Product.where(id: cookies.signed[:recently_product_ids]).take(6) if cookies.signed[:recently_product_ids]
    end
  end

  # def update
  #   current_user.update( user_params)
  #   redirect_to home_path(current_user.id)

  # end

  private
  def build_recently_products_user
    if cookies.signed[:recently_product_ids]
      cookies.signed[:recently_product_ids].each { |item| recently_product = current_user.recently_products.create(product_id: item) }
    end
  end
  def user_params
    params.require(:user).permit(:phone, :name, :address, :gender, :birthday)
  end
end
