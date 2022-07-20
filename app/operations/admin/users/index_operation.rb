class Admin::Users::IndexOperation < ApplicationOperation
  attr_reader :users
  attr_reader :q

  def initialize(params)
    @params = params
  end

  def perform
    load_query
    load_users
  end

  private

  def load_query
    @q = User.all.ransack(params[:q])
  end

  def load_users
    @users = @q.result.order(updated_at: :desc).page(params[:page]).per(20)
  end
end
