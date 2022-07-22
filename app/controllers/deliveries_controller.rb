class DeliveriesController < ApplicationController
  before_action :current_user, only: [:edit]
  def index
    operator = Deliveries::IndexOperation.new(params, current_user)
    operator.perform
    @deliveries = operator.deliveries
  end

  def edit
    operator = Deliveries::EditOperation.new(params, current_user)
    operator.perform
    @delivery = operator.delivery

  end

  def update
    operator = Deliveries::UpdateOperation.new(params, current_user)
    operator.perform
    @delivery = operator.delivery
    @errors = operator.errors
    if @errors.blank?
      redirect_back fallback_location: request.referrer, notice: 'Delivery was successfully updated.'
    else
      render :edit
    end
  end

  def new
    operator = Deliveries::NewOperation.new(params, current_user)
    operator.perform
    @delivery = operator.delivery
  end

  def create
    operator = Deliveries::CreateOperation.new(params, current_user)
    operator.perform
    @delivery = operator.delivery
    @errors = operator.errors
    if @errors.blank?
      redirect_back fallback_location: request.referrer, notice: t('label.delivery.create')
    else
      render :new
    end
  end

  def destroy
    operator = Deliveries::DestroyOperation.new(params)
    operator.perform
    redirect_back fallback_location: request.referrer
  end
end
