module Admin
  class Banners::NewOperation < ApplicationOperation
    attr_reader :banner

    def initialize(params)
      @params = params
    end

    def perform
      build_banner
    end

    private

    def build_banner
      @banner = Banner.new
    end
  end
end
