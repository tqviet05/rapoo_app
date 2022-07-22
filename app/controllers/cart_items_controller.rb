class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    operator = CartItems::CreateOperation.new(params, current_user)
    operator.perform
    errors = operator.errors
    if errors.blank?
      redirect_back fallback_location: request.referrer, notice: t('label.cart_items.create')
    else
      redirect_back fallback_location: request.referrer, alert: errors.full_messages.first
    end
  end

  def destroy
    operator = CartItems::DestroyOperation.new(params, current_user)
    operator.perform
    redirect_back fallback_location: request.referrer, alert: t('label.cart_items.destroy')
  end

  def update
    operator = CartItems::UpdateOperation.new(params, current_user)
    operator.perform
    errors = operator.errors
    if errors.blank?
      redirect_back fallback_location: request.referrer, notice: t('label.cart_items.update')
    else
      redirect_back fallback_location: request.referrer, alert: errors.full_messages.first
    end
  end
end
