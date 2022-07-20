class Admin::Categories::DestroyOperation < ApplicationOperation
  def initialize(params)
    @params = params
  end

  def perform
    destroy_category
  end

  private

  def destroy_category
    Category.find(params[:id]).destroy!
  end
end
