module Products
  class ShowOperation < ApplicationOperation
    attr_reader :cookies
    attr_reader :product
    attr_reader :recently_product_ids
    attr_reader :product_attachments
    # attr_reader :categories

    def initialize(params, recently_product_ids)
      @params = params
      @recently_product_ids = recently_product_ids
      # @current_user = current_user
      # @recently_product_ids = recently_product_ids || []
    end

    def perform
      load_products
      load_products_attachments
      add_recently_product
      # load_recently_product_user
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

    # def load_recently_product_user
    #   if current_user
    #     build_recently_products_user
    #     product_ids_rencently = current_user.recently_products.pluck(:product_id).compact
    #     @recently_products = Product.where(id: product_ids_rencently).order(updated_at: :desc).take(6)
    #   else
    #     @recently_products = Product.where(id: recently_product_ids).take(6) if recently_product_ids
    #   end
    # end

    # def build_recently_products_user
    #   recently_product_ids.each { |product_id| current_user.recently_products.create(product_id: product_id) }
    # end

    # def user_params
    #   params.require(:user).permit(:phone, :name, :address, :gender, :birthday)
    # end
  end
end
