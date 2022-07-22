class Admin::ProductsController < AdminController
  def index
    operator = Admin::Products::IndexOperation.new(params)
    operator.perform
    @q = operator.q
    @products = operator.products
  end

  def edit
    operator = Admin::Products::EditOperation.new(params)
    operator.perform
    @product = operator.product
    @product_attachments = operator.product_attachments
  end

  def update
    operator = Admin::Products::UpdateOperation.new(params)
    operator.perform
    @errors = operator.errors
    if @errors.blank?
      redirect_to admin_products_path, notice: t('label.admin.products.update')
    else
      @product = operator.product
      @product_attachments = operator.product_attachments
      render :edit
    end
  end

  def new
    operator = Admin::Products::NewOperation.new
    operator.perform
    @product = operator.product
    @product_attachments = operator.product_attachments
  end

  def create
    operator = Admin::Products::CreateOperation.new(params)
    operator.perform
    @errors = operator.errors
    if @errors.blank?
      redirect_to admin_products_path, notice: t('label.admin.products.create')
    else
      @product = operator.product
      @product_attachments = operator.product_attachments
      render :new
    end
  end

  def destroy
    operator = Admin::Products::DestroyOperation.new(params)
    operator.perform
    redirect_back fallback_location: request.referrer
  end
end
