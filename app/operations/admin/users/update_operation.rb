class Admin::Users::UpdateOperation < ApplicationOperation

  def initialize(params)
    @params = params
  end

  def perform
    load_user
    update_user
  end

  private

  def load_user
    @user = User.find_by(id: params[:id])
  end

  def update_user
    @user.update( user_params)
  end
  
  def user_params
    params.require(:user).permit(:phone, :name, :address, :gender, :birthday)
  end
end
