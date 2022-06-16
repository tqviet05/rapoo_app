class Admin::ProductsController < AdminController
  def index
    @q = Product.all.includes(:category).includes(:product_attachments).ransack(params[:q])
    @products = @q.result.page(params[:page]).per(20)
    # @product_attachments = @product.product_attachments.all
  end

  def edit
    @product = Product.find_by(id: params[:id])
    @product_attachments = @product.product_attachments.build
  end

  def update
    @product = Product.find_by(id: params[:id])
    # redirect_to admin_products_path
    respond_to do |format|
      if @product.update(product_params)
        params[:product_attachments]["image"].each do |i|
          @product_attachments = @product.product_attachments.create!(image: i)
        end
        format.html { redirect_to admin_products_path, notice: 'Post was successfully created.'}
      else
        format.html { redirect_to edit_admin_product_path}
      end
    end
  end

  def new
    @product = Product.new
    @product_attachments = @product.product_attachments.build
  end

  def create

    @product = Product.new(product_params)
    # @product_attachments = @product.product_attachments.new(image: params[:product][:product_attachments_attributes])
    if @product.save
      # params[:product_attachments]["image"].each { |image| @product.product_attachments.create!(image: image) }
      redirect_to admin_products_path, notice: 'Post was successfully created.'
    else
      @product_attachments = @product.product_attachments.build
      render :new
    end
  end

  def destroy
    Product.find(params[:id]).destroy!
    redirect_to request.referrer || admin_products_path
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :price, :description, :category_id, product_attachments_attributes: [image: []])
  end
end
