class Admin::OrdersController < AdminController
  def index
    operator = Admin::Orders::IndexOperation.new(params)
    operator.perform
    @q = operator.q
    @orders = operator.orders
  end

  def edit
    operator = Admin::Orders::EditOperation.new(params)
    operator.perform
    @order = operator.order
  end

  def update
    operator = Admin::Orders::UpdateOperation.new(params)
    operator.perform
    @errors = operator.errors
    if @errors.blank?
      redirect_to admin_orders_path, notice: t('label.admin.orders.update')
    else
      @order = operator.order
      render :edit
    end
  end

  def destroy
    operator = Admin::Orders::DestroyOperation.new(params)
    operator.perform
    redirect_back fallback_location: request.referrer
  end
end
