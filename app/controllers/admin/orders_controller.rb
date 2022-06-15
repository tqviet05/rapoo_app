class Admin::OrdersController < AdminController
  def index
    @q = Order.all.ransack(params[:q])
    @orders = @q.result.page(params[:page]).per(20)
  end

  def edit
    @order = Order.find_by(id: params[:id])
  end

  def update
    order = Order.find_by(id: params[:id])
    order.update( order_params)
    redirect_to admin_orders_path
  end

  def destroy
    Order.find(params[:id]).destroy!
    redirect_to request.referrer || admin_orders_path
  end

  private

  def order_params
    params.require(:order).permit(:phone, :name, :address)
  end
end
