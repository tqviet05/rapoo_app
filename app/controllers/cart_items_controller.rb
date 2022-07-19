class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    operator = CartItems::CreateOperation.new(params, current_user)
    operator.perform
    errors = operator.errors
    if errors.blank?
      redirect_back fallback_location: request.referrer, notice: 'Add cart success'
    else
      redirect_back fallback_location: request.referrer, alert: errors.full_messages.first
    end
  end

  def destroy
    operator = CartItems::DestroyOperation.new(params, current_user)
    operator.perform
    redirect_back fallback_location: request.referrer, alert: 'Delete cart success'
  end

  def update
    operator = CartItems::UpdateOperation.new(params, current_user)
    operator.perform
    errors = operator.errors
    if errors.blank?
      redirect_back fallback_location: request.referrer, notice: 'Add cart success'
    else
      redirect_back fallback_location: request.referrer, alert: errors.full_messages.first
    end
  end
end
