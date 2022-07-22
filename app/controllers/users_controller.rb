class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def edit
    operator = Users::EditOperation.new(current_user)
    operator.perform
    @user = operator.user
  end

  def update
    operator = Users::UpdateOperation.new(current_user, params)
    operator.perform
    redirect_to user_path(current_user.id)
  end

  def order
    operator = Users::OrderOperation.new(current_user, params)
    operator.perform
    @orders = operator.orders
  end
end