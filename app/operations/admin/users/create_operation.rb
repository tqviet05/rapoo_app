class Admin::Users::CreateOperation < ApplicationOperation
  attr_reader :user

  def initialize(params)
    @params = params
  end

  def perform
    load_user
    validation { return @errors}
    build_user
  end

  private

  def load_user
    @form = @user = User.new user_params
  end

  def validation
    if @form.invalid?
      assignment_error
      yield
    end
  end
  def build_user
    @user.save
  end
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
