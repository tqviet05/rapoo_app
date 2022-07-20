class Admin::Categories::IndexOperation < ApplicationOperation
  attr_reader :categories
  attr_reader :q

  def initialize(params)
    @params = params
  end

  def perform
    load_query
    load_categories
  end

  private

  def load_query
    @q = Category.all.order(:id).ransack(params[:q])
  end

  def load_categories
    @categories = @q.result.page(params[:page]).per(20)
  end
end
