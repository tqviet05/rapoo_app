class Admin::Products::CreateOperation < ApplicationOperation
  attr_reader :product, :product_attachments

  def initialize(params)
    @params = params
  end

  def perform
    build_product
    build_product_attachments
    validation { return @errors}
    create_product
    create_product_attachments
  end

  private

  def build_product
    @product = Product.new product_params
  end

  def validation
    @form = Admin::Products::CreateForm.new(product_params)
    if @form.invalid?
      assignment_error
      yield
    end
  end

  def create_product
    @product = Product.create product_params
  end
  
  def build_product_attachments
    @product_attachments = @product.product_attachments.build
  end

  def create_product_attachments
    unless product_attachments_params.blank?
    product_attachments_params[:image].each {
      |image| @product_attachments = @product.product_attachments.create!(image: image)
    }
    end
  end

  def product_params
    params.require(:product).permit(
      :image, 
      :name, 
      :price, 
      :description,
      :category_id, 
    )
  end
  def product_attachments_params
    params.require(:product).require(:product_attachments_attributes).permit(image: [])
  end
end
