module Products
  class IndexOperation < ApplicationOperation
    attr_reader :products

    def initialize(params)
      @params = params

    end

    def perform
      load_products
    end

    private

    def load_products
    @products = build_ransack.result.page(params[:page]).per(12)
    end
  end
end
