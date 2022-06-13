class UsersController < ApplicationController
  before_action :authenticate_user!
  def address
    # @query = Product.ransack(params[:query])
    @query = current_user.deliveries.ransack(params[:query])
    @deliveries = @query.result.page(params[:page]).per(4)
    
  end
  def show
  end
  def edit
    @user = current_user
  end
  def update
    current_user.update( user_params)
    redirect_to user_path(current_user.id)
  end
  def order
    @or = current_user.orders.order(id: :desc).includes(:order_items).ransack(params[:query])
    @orders = @or.result.page(params[:page]).per(4)
  end

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