class Admin::Users::EditOperation < ApplicationOperation
  attr_reader :user

  def initialize(params)
    @params = params
  end

  def perform
    load_user
  end

  private

  def load_user
    @user = User.find_by(id: params[:id])
  end
end
