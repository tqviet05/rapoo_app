module Admin
  class Banners::IndexOperation < ApplicationOperation
    attr_reader :banners
    attr_reader :q

    def initialize(params)
      @params = params
    end

    def perform
      load_query
      load_banners
    end

    private

    def load_query
      @q = Banner.all.order(:id).ransack(params[:q])
    end

    def load_banners
      @banners = @q.result.page(params[:page]).per(20)
    end
  end
end
