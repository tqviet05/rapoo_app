class OrderController < ApplicationController
  before_action :authenticate_user!
  before_action :current_cart! 

  def new
    operator = Orders::NewOperation.new(current_cart, current_user)
    operator.perform
    @cart_items = operator.cart_items
    @total  = @current_cart[:total_money]
    @deliveries = operator.deliveries
    @deliveries_form = operator.deliveries_form
  end

  def create
    operator = Orders::CreateOperation.new(current_cart, current_user, params)
    operator.perform
    @errors = operator.errors
    unless @errors.blank?
      @cart_items = operator.cart_items
      @total  = @current_cart[:total_money]
      @deliveries = operator.deliveries
      @deliveries_form = operator.deliveries_form
      return render :new
    end
    @current_order = operator.current_order
    redirect_to histories_path, notice: t('label.order.create')
  end
  
  private
  def current_cart!
    redirect_to root_path , alert: t('label.order.alert') if current_cart.blank?
  end
end
