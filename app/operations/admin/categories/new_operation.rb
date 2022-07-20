class Admin::Categories::NewOperation < ApplicationOperation
  attr_reader :category


  def perform
    load_category
  end

  private

  def load_category
    @category = Category.new
  end
end
