module Admin
  class Banners::DestroyOperation < ApplicationOperation
    def initialize(params)
      @params = params
    end

    def perform
      destroy_banner
    end

    private

    def destroy_banner
      Banner.find(params[:id]).destroy!
    end
  end
end
