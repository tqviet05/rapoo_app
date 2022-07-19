module Users
  class UpdateOperation < ApplicationOperation

    def initialize(current_user, params)
      @current_user = current_user
      @params = params
    end

    def perform
      update_user
    end

    private

    def update_user
    @user = current_user.update(user_params)
    end

    def user_params
      params.require(:user).permit(:phone, :name, :address, :gender, :birthday)
    end
  end
end
