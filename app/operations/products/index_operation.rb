module Products
  class IndexOperation < ApplicationOperation
    # attr_reader :banners
    attr_reader :products
    # attr_reader :recently_product_ids
    # attr_reader :recently_products 
    # attr_reader :categories

    def initialize(params)
      @params = params
      # @current_user = current_user
      # @recently_product_ids = recently_product_ids || []
    end

    def perform
      # load_banner
      # load_categories
      load_products
      # load_recently_product_user
    end

    private

    # def load_banner
    #   @banners = Banner.all
    # end

    # def load_categories
    #   @categories = Category.all.order(position: :asc)
    # end

    def load_products
    @products = build_ransack.result.page(params[:page]).per(12)
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
