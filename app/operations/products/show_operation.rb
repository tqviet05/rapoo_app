module Products
  class ShowOperation < ApplicationOperation
    attr_reader :cookies
    attr_reader :product
    attr_reader :recently_product_ids
    attr_reader :product_attachments

    def initialize(params, recently_product_ids)
      @params = params
      @recently_product_ids = recently_product_ids
    end

    def perform
      load_products
      load_products_attachments
      add_recently_product
    end

    private

    def load_products
    @product = Product.find_by(id: params[:id])
    end

    def load_products_attachments
      @product_attachments = @product&.product_attachments
    end

    def add_recently_product
      if recently_product_ids.blank?
        @recently_product_ids = [@product.id]
      else
        @recently_product_ids << @product.id
        @recently_product_ids.uniq!
      end
    end
  end
end
