module Admin
  class Banners::CreateOperation < ApplicationOperation
    attr_reader :banner

    def initialize(params)
      @params = params
    end

    def perform
      # binding.pry
      load_banner
      validation { return @errors}
      build_banner
    end

    private

    def load_banner
      @banner = Banner.new banner_params
    end

    def validation
      @form = Banners::CreateForm.new(banner_params)
      if @form.invalid?
        assignment_error
        yield
      end
    end

    def build_banner
      @banner.save!
    end
    
    def banner_params
      params.merge!(banner: { image: nil }) if params[:banner].blank?
      params.require(:banner).permit(:image)
    end
  end
end
