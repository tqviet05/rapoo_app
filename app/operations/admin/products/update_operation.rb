class Admin::Products::UpdateOperation < ApplicationOperation
  attr_reader :product, :product_attachments

  def initialize(params)
    @params = params
  end

  def perform
    load_product
    build_product_attachments
    validation { return @errors}
    update_product
    create_product_attachments 
  end

  private

  def load_product
    @product = Product.find_by(id: params[:id])
  end

  def validation
    @form = Admin::Products::UpdateForm.new(product_params)
    if @form.invalid?
      assignment_error
      yield
    end
  end

  def build_product_attachments
    @product_attachments = @product.product_attachments.build
  end
  def update_product
    @product.update( product_params)
  end
  def create_product_attachments
    unless params[:product][:product_attachments_attributes][:image].blank?
      params[:product][:product_attachments_attributes][:image].each {
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
    params.require(:product).permit(
      product_attachments_attributes: [image: []]
    )
  end
end
