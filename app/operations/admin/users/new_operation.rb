class Admin::Users::NewOperation < ApplicationOperation
  attr_reader :user


  def perform
    load_user
  end

  private

  def load_user
    @user = User.new
  end
end
