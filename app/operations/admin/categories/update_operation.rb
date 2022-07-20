class Admin::Categories::UpdateOperation < ApplicationOperation
  attr_reader :category

  def initialize(params)
    @params = params
  end

  def perform
    load_category
    validation { return @errors}
    update_category
  end

  private

  def load_category
    @category = Category.find_by(id: params[:id])
  end

  def validation
    @form = Admin::Categories::UpdateForm.new(category_params)
    if @form.invalid?
      assignment_error
      yield
    end
  end

  def update_category
    @category.update( category_params)
  end
  
  def category_params
    params.require(:category).permit(:position, :name)
  end
end
