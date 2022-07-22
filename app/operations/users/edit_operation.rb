module Users
  class EditOperation < ApplicationOperation
    attr_reader :user

    def initialize(current_user)
      @current_user = current_user
    end

    def perform
      load_user
    end

    private
    def load_user
    @user = current_user
    end
  end
end
