class Admin::Categories::CreateOperation < ApplicationOperation
  attr_reader :category

  def initialize(params)
    @params = params
  end

  def perform
    load_category
    validation { return @errors}
    build_category
  end

  private

  def load_category
    @category = Category.new category_params
  end

  def validation
    @form = Admin::Categories::CreateForm.new(category_params)
    if @form.invalid?
      assignment_error
      yield
    end
  end

  def build_category
    @category.save!
  end
  
  def category_params
    params.require(:category).permit(:position, :name)
  end
end
