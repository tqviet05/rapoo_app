class Admin::Users::CreateOperation < ApplicationOperation
  attr_reader :user

  def initialize(params)
    @params = params
  end

  def perform
    load_user
    build_user
  end

  private

  def load_user
    @user = User.new user_params
  end

  def build_user
    @user.save!
  end
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
