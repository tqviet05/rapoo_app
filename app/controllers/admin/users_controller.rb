class Admin::UsersController < AdminController
  def index
    @q = User.all.ransack(params[:q])
    @users = @q.result.order(updated_at: :desc).page(params[:page]).per(20)
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    user = User.find_by(id: params[:id])
    user.update( user_params)
    redirect_to admin_users_path
  end

  def new
    @user = User.new

  end

  def create
    param = params.require(:user).permit(:email, :password, :password_confirmation)
    user = User.create(param)
    redirect_to admin_users_path

  end

  def destroy
    User.find(params[:id]).destroy!
    redirect_to request.referrer || admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:phone, :name, :address, :gender, :birthday)
  end
end
