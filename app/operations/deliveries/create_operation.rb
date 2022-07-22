module Deliveries
  class CreateOperation < ApplicationOperation
    attr_reader :delivery
    def initialize(params, current_user)
      @params = params
      @current_user = current_user
    end

    def perform
      build_delivery
      validation { return @errors}
      update_delivery
    end

    private

    def build_delivery
      @delivery = current_user.deliveries.build
    end
    
    def validation
      @form = Deliveries::CreateForm.new(permit_params)
      if @form.invalid?
        assignment_error
        yield
      end
    end

    def update_delivery
      @delivery.update(permit_params)
    end


    def permit_params
      params.require(:delivery).permit(:name, :phone, :address)
    end
  end
end
