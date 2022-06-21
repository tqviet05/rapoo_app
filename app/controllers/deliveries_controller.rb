class DeliveriesController < ApplicationController
  before_action :current_user, only: [:edit]
  def index
    @deliveries = current_user.deliveries.page(params[:page]).per(4)
  end
  def show
    @deliveries = current_user.deliveries.page(params[:page]).per(4)
  end

  def edit
    @delivery = current_user.deliveries.find(params[:id])

  end

  def update
    @delivery = current_user.deliveries.find(params[:id])
    if @delivery.update(param)
      redirect_to deliveries_path, notice: 'Delivery was successfully updated.'
    else
      render :edit
      # redirect_to request.referrer, alert: "Delivery was not updated. #{@delivery.errors.messages}"
    end
  end

  def new
    @delivery = current_user.deliveries.build
  end

  def create
    @delivery = current_user.deliveries.build
    if @delivery.update(param)
      redirect_to deliveries_path, notice: 'Delivery was successfully updated.'
    else
      render :new
    end
    
  end

  def destroy
    Delivery.find(params[:id]).destroy!
    redirect_to request.referrer || user_address_path
  end

  private
  def param
    params.require(:delivery).permit(:name, :phone, :address)
  end
end
