class Admin::UsersController < AdminController
  def index
    operator = Admin::Users::IndexOperation.new(params)
    operator.perform
    @q = operator.q
    @users = operator.users
  end

  def edit
    operator = Admin::Users::EditOperation.new(params)
    operator.perform
    @user = operator.user
  end

  def update
    operator = Admin::Users::UpdateOperation.new(params)
    operator.perform
    redirect_to admin_users_path, notice: t('label.admin.users.update')
  end

  def new
    operator = Admin::Users::NewOperation.new
    operator.perform
    @user = operator.user
  end

  def create
    operator = Admin::Users::CreateOperation.new(params)
    operator.perform
    @errors = operator.errors
    if @errors.blank?
      redirect_to admin_users_path, notice: t('label.admin.users.create')
    else
      @user = operator.user
      render :new
    end
  end

  def destroy
    operator = Admin::Users::DestroyOperation.new(params)
    operator.perform
    redirect_back fallback_location: request.referrer
  end
end
