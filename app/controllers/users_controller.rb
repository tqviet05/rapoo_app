class UsersController < ApplicationController
  before_action :authenticate_user!
  def address
    @deliveries = current_user.deliveries.page(params[:page]).per(4)
  end

  def show
  end

  def new
    @delivery = current_user.deliveries.build
    
    binding.pry
  end

  def edit
    @user = current_user
  end

  def update
    current_user.update( user_params)
    redirect_to user_path(current_user.id)
  end

  def order
    @orders = current_user.orders.order(id: :desc).includes(:order_items).page(params[:page]).per(2)
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