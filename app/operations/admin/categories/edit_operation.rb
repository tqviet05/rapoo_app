class Admin::Categories::EditOperation < ApplicationOperation
  attr_reader :category

  def initialize(params)
    @params = params
  end

  def perform
    load_category
  end

  private

  def load_category
    @category = Category.find(params[:id])
  end
end
