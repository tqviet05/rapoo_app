class Admin::Users::DestroyOperation < ApplicationOperation
  def initialize(params)
    @params = params
  end

  def perform
    destroy_user
  end

  private

  def destroy_user
    User.find(params[:id]).destroy!
  end
end
