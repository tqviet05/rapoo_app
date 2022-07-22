module Deliveries
  class UpdateOperation < ApplicationOperation
    attr_reader :delivery
    def initialize(params, current_user)
      @params = params
      @current_user = current_user
    end

    def perform
      load_delivery
      validation { return @errors}
      update_delivery
    end

    private

    def load_delivery
      @delivery = current_user.deliveries.find(params[:id])
    end
    
    def validation
      @form = Deliveries::UpdateForm.new(permit_params)
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
