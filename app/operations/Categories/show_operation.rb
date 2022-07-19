module Categories
  class ShowOperation < ApplicationOperation
    attr_reader :categories
    attr_reader :products

    def initialize(params)
      @params = params
    end

    def perform
      load_categories
      load_products
    end

    private

    def load_categories
      @categories = Category.all.order(position: :asc)
    end

    def load_products
      @products = Category.find_by!(id: params[:id]).products.page(params[:page]).per(12)
    end
  end
end
